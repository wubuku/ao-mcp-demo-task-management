--- Cancel the task
--
-- @module task_cancel_task_logic

local task = require("task")

local task_cancel_task_logic = {}


--- Verifies the Task.CancelTask command.
-- @param _state table The current state of the Task
-- @param cmd table The command
-- @param msg any The original message. Properties of an AO msg may include `Timestamp`, `Block-Height`, `Owner`, `Nonce`, etc.
-- @param env table The environment context
-- @return table The event, can use `task.new_task_cancelled` to create it
function task_cancel_task_logic.verify(_state, cmd, msg, env)
    --- Before returning the event, we can check the arguments;
    -- if there are illegal arguments, throw error
    -- NOTE: Do not arbitrarily add parameters to functions or fields to structs.

    -- Business rule: can only cancel a task if it's not already completed or cancelled
    if _state.Status == "COMPLETED" or _state.Status == "CANCELLED" then
        error("Task cannot be cancelled if it's already completed or cancelled")
    end

    return task.new_task_cancelled(
        _state -- type: table
    )
end

--- Applies the event to the current state and returns the updated state.
-- @param state table The current state of the Task
-- @param event table The event
-- @param msg any The original message. Properties of an AO msg may include `Timestamp`, `Block-Height`, `Owner`, `Nonce`, etc.
-- @param env any The environment context
-- @return table The updated state of the Task
function task_cancel_task_logic.mutate(state, event, msg, env)
    --- Update the current state with the event properties then return it
    state.Status = "CANCELLED"
    state.UpdatedAt = msg.Timestamp or os.time()
    return state
end

return task_cancel_task_logic
