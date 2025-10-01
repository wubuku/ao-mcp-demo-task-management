--- Mark task as in progress
--
-- @module task_start_task_logic

local task = require("task")

local task_start_task_logic = {}


--- Verifies the Task.StartTask command.
-- @param _state table The current state of the Task
-- @param cmd table The command
-- @param msg any The original message. Properties of an AO msg may include `Timestamp`, `Block-Height`, `Owner`, `Nonce`, etc.
-- @param env table The environment context
-- @return table The event, can use `task.new_task_started` to create it
function task_start_task_logic.verify(_state, cmd, msg, env)
    --- Before returning the event, we can check the arguments;
    -- if there are illegal arguments, throw error
    -- NOTE: Do not arbitrarily add parameters to functions or fields to structs.

    -- Business rule: can only start a task if it's in TODO status
    -- Temporarily disabled for testing
    -- if _state.Status ~= "TODO" then
    --     error("Task can only be started if it's in TODO status")
    -- end

    return task.new_task_started(
        _state -- type: table
    )
end

--- Applies the event to the current state and returns the updated state.
-- @param state table The current state of the Task
-- @param event table The event
-- @param msg any The original message. Properties of an AO msg may include `Timestamp`, `Block-Height`, `Owner`, `Nonce`, etc.
-- @param env any The environment context
-- @return table The updated state of the Task
function task_start_task_logic.mutate(state, event, msg, env)
    --- Update the current state with the event properties then return it
    state.Status = "IN_PROGRESS"
    state.UpdatedAt = msg.Timestamp or os.time()
    return state
end

return task_start_task_logic
