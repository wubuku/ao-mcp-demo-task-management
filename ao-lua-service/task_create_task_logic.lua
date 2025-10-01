--- Create a new task
--
-- @module task_create_task_logic

local task = require("task")

local task_create_task_logic = {}


--- Verifies the Task.CreateTask command.
-- @param _state table The current state of the Task. Maybe nil.
-- @param task_id table The TaskId of the Task
-- @param title string 
-- @param description string 
-- @param priority string 
-- @param assignee string 
-- @param due_date number 
-- @param tags table 
-- @param cmd table The command
-- @param msg any The original message. Properties of an AO msg may include `Timestamp`, `Block-Height`, `Owner`, `Nonce`, etc.
-- @param env table The environment context
-- @return table The event, can use `task.new_task_created` to create it
function task_create_task_logic.verify(_state, task_id, title, description, priority, assignee, due_date, tags, cmd, msg, env)
    --- Before returning the event, we can check the arguments;
    -- if there are illegal arguments, throw error
    -- NOTE: Do not arbitrarily add parameters to functions or fields to structs.

    -- Validate required fields
    if not title or title == "" then
        error("Task title is required")
    end

    local created_at = msg.Timestamp or os.time()
    local updated_at = created_at

    return task.new_task_created(
        task_id, -- type: table
        _state, -- type: table (current state, nil for create)
        title, -- type: string
        description, -- type: string
        priority, -- type: string
        assignee, -- type: string
        due_date, -- type: number
        tags -- type: table
    )
end

--- Applies the event to the current state and returns the updated state.
-- @param state table The current state of the Task. Maybe nil for the first event.
-- @param event table The event
-- @param msg any The original message. Properties of an AO msg may include `Timestamp`, `Block-Height`, `Owner`, `Nonce`, etc.
-- @param env any The environment context
-- @return table The updated state of the Task
function task_create_task_logic.mutate(state, event, msg, env)
    if (not state) then
        -- Create a new state
        state = task.new(
            event.title, -- type: string. Task title
            event.description, -- type: string. Task description
            event.priority, -- type: string. Task priority
            event.assignee, -- type: string. Person assigned to the task
            event.due_date, -- type: number. Due date timestamp
            "TODO", -- type: string. Current task status (default to TODO)
            event.tags -- type: table. (Tag list). Task tags
        )
        -- Add timestamps
        state.CreatedAt = created_at
        state.UpdatedAt = updated_at
    else
        -- Update state with event properties (should not happen for create)
        state.Title = event.title
        state.Description = event.description
        state.Priority = event.priority
        state.Assignee = event.assignee
        state.DueDate = event.due_date
        state.Tags = event.tags
        state.CreatedAt = event.created_at
        state.UpdatedAt = event.updated_at
    end
    return state
end

return task_create_task_logic
