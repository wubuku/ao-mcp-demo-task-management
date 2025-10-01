--- Update task information
--
-- @module task_update_task_logic

local task = require("task")

local task_update_task_logic = {}


--- Verifies the Task.UpdateTask command.
-- @param _state table The current state of the Task
-- @param title string 
-- @param description string 
-- @param priority string 
-- @param assignee string 
-- @param due_date number 
-- @param tags table 
-- @param cmd table The command
-- @param msg any The original message. Properties of an AO msg may include `Timestamp`, `Block-Height`, `Owner`, `Nonce`, etc.
-- @param env table The environment context
-- @return table The event, can use `task.new_task_updated` to create it
function task_update_task_logic.verify(_state, title, description, priority, assignee, due_date, tags, cmd, msg, env)
    --- Before returning the event, we can check the arguments;
    -- if there are illegal arguments, throw error
    -- NOTE: Do not arbitrarily add parameters to functions or fields to structs.

    -- Validate that task exists and can be updated
    if not _state then
        error("Task not found")
    end

    return task.new_task_updated(
        _state, -- type: table
        title, -- type: string
        description, -- type: string
        priority, -- type: string
        assignee, -- type: string
        due_date, -- type: number
        tags -- type: table
    )
end

--- Applies the event to the current state and returns the updated state.
-- @param state table The current state of the Task
-- @param event table The event
-- @param msg any The original message. Properties of an AO msg may include `Timestamp`, `Block-Height`, `Owner`, `Nonce`, etc.
-- @param env any The environment context
-- @return table The updated state of the Task
function task_update_task_logic.mutate(state, event, msg, env)
    --- Update the current state with the event properties then return it
    if event.title then state.Title = event.title end
    if event.description then state.Description = event.description end
    if event.priority then state.Priority = event.priority end
    if event.assignee then state.Assignee = event.assignee end
    if event.due_date then state.DueDate = event.due_date end
    if event.tags then state.Tags = event.tags end
    state.UpdatedAt = msg.Timestamp or os.time()
    return state
end

return task_update_task_logic
