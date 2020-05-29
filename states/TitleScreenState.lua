TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function TitleScreenState:render()
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Bird Sim 2000', 0, 64, vw, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press Start!', 0, 100, vw, 'center')
end
    