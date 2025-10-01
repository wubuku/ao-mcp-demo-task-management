# Building a DDDML-Driven AO Task Management System

> 📖 **EN Docs**: [DEVELOPMENT_GUIDE.md](DEVELOPMENT_GUIDE.md) | **中文文档**: [DEVELOPMENT_GUIDE_CN.md](DEVELOPMENT_GUIDE_CN.md)

## Prerequisites

- Install Node.js and npm
- Install AOS
- Install Docker
- Install iTerm2 and configure the [iTerm MCP Server](https://github.com/ferrislucas/iterm-mcp) in your MCP Client (e.g., Cursor) for automated testing.
- Pull the DDDML AO MCP Server image by running `docker pull wubuku/dddml-ao-mcp-server:latest`.

## DDDML AO MCP Server

Use the following Docker MCP Server wrapper script:

https://gist.github.com/wubuku/d5a567d20f2820c011317c57cbbb2638

This is a shell script for macOS/Unix. For Windows, you may need to adapt it to a PowerShell script.

Save this script as `dddml-mcp-wrapper.sh` in a directory of your choice and make it executable:
`chmod +x /PATH/TO/dddml-mcp-wrapper.sh`

## MCP Client Configuration

Example for Cursor IDE:

```json
    "dddml-ao-mcp-server": {
      "command": "/PATH/TO/dddml-mcp-wrapper.sh",
      "args": ["--platform", "ao"],
      "options": {
        "cwd": "${workspaceFolder}"
      }
    }
```

---

With the prerequisites in place, you can provide the following prompt to the AI, which will then generate a feature-rich AO Dapp.

## Prompt

```
Using the available AO MCP Server, create a simple, DDDML-driven task management system.

Business Requirements:
- Create tasks with a title, description, priority, assignee, due date, and tags.
- Manage task states: To Do, In Progress, Completed, Canceled.
- Transition tasks between states (e.g., start, complete, cancel).
- Query tasks by status, assignee, and priority.
- Update existing task information.

**Monitor the AO MCP Server for resources and prompts.** These will provide detailed instructions for testing with the iTerm MCP Server, including:
- AO process startup and configuration.
- Application code loading procedures.
- Test case execution methods.
- Result validation techniques.

Use the iTerm MCP Server to test the generated code and ensure all tests pass. If you encounter issues, debug the code and re-run the tests until they succeed.

Finally, document and summarize the entire process in the `README.md` file.
```

---

## DDDML-Driven AO Dapp Example Repositories

### A-AO-Demo Example Repository

**Project URL**: https://github.com/dddappp/A-AO-Demo

This repository provides a **comprehensive** example of an AO application, highlighting the following key features:

#### 🎯 Core Features
- **Low-Code Philosophy**: Demonstrates developing complex decentralized AO applications using low-code methods.
- **End-to-End Application Architecture**: Includes complete application examples, from simple to complex.
- **Best Practices**: Offers detailed development documentation and usage instructions.

### AI-Assisted-AO-Dapp-Example Example Repository

**Project URL**: https://github.com/dddappp/AI-Assisted-AO-Dapp-Example

This repository showcases **AI-assisted development** for AO applications, focusing on:

#### 🎯 Core Features
- **AI-Assisted Development**: Shows how AI can help write business logic.
- **Streamlined Workflow**: Illustrates how low-code platforms can revolutionize Dapp development.
- **Progressive Learning Curve**: Starts with simple examples and gradually introduces more advanced concepts.

### 💡 Recommended Learning Path

1.  **For AO Beginners**: Start with `AI-Assisted-AO-Dapp-Example` to experience the power of DSL combined with AI-assisted development.
2.  **For Advanced Users**: Explore `A-AO-Demo` to understand a complete AO application architecture.

