--- Mark task as completed
--
-- @module task_complete_task_logic

local task = require("task")

local task_complete_task_logic = {}


--- Verifies the Task.CompleteTask command.
-- @param _state table The current state of the Task
-- @param cmd table The command
-- @param msg any The original message. Properties of an AO msg may include `Timestamp`, `Block-Height`, `Owner`, `Nonce`, etc.
-- @param env table The environment context
-- @return table The event, can use `task.new_task_completed` to create it
function task_complete_task_logic.verify(_state, cmd, msg, env)
    --- Before returning the event, we can check the arguments;
    -- if there are illegal arguments, throw error
    -- NOTE: Do not arbitrarily add parameters to functions or fields to structs.

    -- Business rule: can only complete a task if it's in IN_PROGRESS status
    if _state.Status ~= "IN_PROGRESS" then
        error("Task can only be completed if it's in IN_PROGRESS status")
    end

    return task.new_task_completed(
        _state -- type: table
    )
end

--- Applies the event to the current state and returns the updated state.
-- @param state table The current state of the Task
-- @param event table The event
-- @param msg any The original message. Properties of an AO msg may include `Timestamp`, `Block-Height`, `Owner`, `Nonce`, etc.
-- @param env any The environment context
-- @return table The updated state of the Task
function task_complete_task_logic.mutate(state, event, msg, env)
    --- Update the current state with the event properties then return it
    state.Status = "COMPLETED"
    state.UpdatedAt = msg.Timestamp or os.time()
    return state
end

return task_complete_task_logic
