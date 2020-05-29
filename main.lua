push = require 'push'
Class = require 'class'

require 'Bird'
require 'Pipe'
require 'PipePair'

require 'StateMachine'
require 'states/BaseState'
require 'states/CountDownState'
require 'states/PlayState'
require 'states/ScoreState'
require 'states/TitleScreenState'



ww = 1280
wh = 720

vw = 512
vh = 288

local bg = love.graphics.newImage('background.png')
local bgScroll = 0

local gr = love.graphics.newImage('ground.png')
local grScroll = 0

local bgScrollSpeed = 30
local grScrollSpeed = 80
local bgLoopPt = 650
local grLoopPt = 514


--[[local bird = Bird()

local pipePairs = {}
--local pipes = {}
local spawnTimer = 0
local lastY = -pieght + math.random(80) + 20]]--
local scrolling = true

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    --math.randomseed(os.time())
    love.window.setTitle('Bird Simulator')


    smallFont = love.graphics.newFont('font.ttf', 8)
    mediumFont = love.graphics.newFont('flappy.ttf', 14)
    flappyFont = love.graphics.newFont('flappy.ttf', 28)
    HugeFont = love.graphics.newFont('flappy.ttf', 56)
    love.graphics.setFont(flappyFont)

    sounds = {
        ['jump'] = love.audio.newSource('jump.wav', 'static'),
        ['explosion'] = love.audio.newSource('explosion.wav', 'static'),
        ['hurt'] = love.audio.newSource('hurt.wav', 'static'),
        ['score'] = love.audio.newSource('score.wav', 'static'),

        ['music'] = love.audio.newSource('Bg_Track.mp3', 'static')
    }

    sounds['music']:setLooping(true)
    sounds['music']:play()
    
    push:setupScreen(vw, vh, ww, wh,{
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    gStateMachine = StateMachine {
        ['title'] = function() return TitleScreenState() end,
        ['countdown'] = function() return CountDownState() end,
        ['play'] = function() return PlayState() end,
        ['score'] = function() return ScoreState() end
    }
    
    gStateMachine:change('title')
    
    love.keyboard.keysPressed = {}
end

function love.resize(w, h)
    push:resize(w, h)    
end

function love.keypressed(key)
    
    love.keyboard.keysPressed[key] = true
    
    if key == 'escape' then
        love.event.quit()    
    end
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end

function love.update(dt)
    --[[if scrolling then
         bgScroll = (bgScroll + bgScrollSpeed * dt) 
            % bgLoopPt

          grScroll = (grScroll + grScrollSpeed * dt) 
            % grLoopPt

        spawnTimer = spawnTimer + dt

         if spawnTimer > 2 then
              local y = math.max(-pieght + 10, 
                math.min(lastY + math.random(-20, 20), vh - 90 - pieght))
            lastY = y
            
            table.insert(pipePairs, PipePair(y))
            spawnTimer = 0
        end

     bird:update(dt) 
     
     for k, pair in pairs(pipePairs) do
        pair:update(dt)

        for l, pipe in pairs(pair.pipes) do
            if bird:collides(pipe) then
                scrolling = false
            end
        end

        if pair.x < -pidth then
            pair.remove = true
        end
    end

     for k, pair in pairs(pipePairs) do
        if pair.remove then
            table.remove(pipePairs, k)
        end
    end]]--
    bgScroll = (bgScroll + bgScrollSpeed * dt) 
            % bgLoopPt
    grScroll = (grScroll + grScrollSpeed * dt) 
            % grLoopPt
         
    gStateMachine:update(dt)

     love.keyboard.keysPressed = {}

end

function love.draw()
    push:start()   
    love.graphics.draw(bg, -bgScroll, 0)
   
    --[[for k, pair in pairs(pipePairs) do
        pair:render()
    end]]--
    gStateMachine:render()
    love.graphics.draw(gr, -grScroll, vh - 16)
   
    --bird:render()

    push:finish()
end



