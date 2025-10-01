# 创建一个以 DDDML 模型驱动开发的 AO 任务管理系统

> 📖 **EN Docs**: [DEVELOPMENT_GUIDE.md](DEVELOPMENT_GUIDE.md) | **项目文档**: [README.md](README.md)

## 前置条件

- 安装 Node.js 和 npm
- 安装 AOS
- 安装 Docker
- 安装 iTerm2 并在 MCP Client（如 Cursor）中配置好 [iTerm MCP Server](https://github.com/ferrislucas/iterm-mcp)（用于自动化测试）
- 运行 `docker pull wubuku/dddml-ao-mcp-server:latest` 将 DDDML AO MCP Server 拉到本地

## DDDML AO MCP Server

The Docker MCP Server wrapper：

https://gist.github.com/wubuku/d5a567d20f2820c011317c57cbbb2638

这是一个 Shell 脚本，适用于 macOS / Unix。Windows 平台可以考虑让 AI 翻译为 Powershell 脚本。

在本机的任意一个目录中创建一个脚本文件，可以命名为 `dddml-mcp-wrapper.sh`，内容如上。

然后赋予它执行权限：`chmod +x /PATH/TO/dddml-mcp-wrapper.sh`

## MCP Client config

以 Cursor IDE 为例：

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

以上准备妥当之后，就可以将下面的提示词粘贴给 AI。然后就可以等着 AI 给生成一个可以完成度相当高的 AO Dapp。

## Prompt

```
使用可用的 AO MCP Server 创建一个以 DDDML 模型驱动开发的简单任务管理系统。

业务需求：
- 用户可以创建任务，包含标题、描述、优先级、负责人、截止时间、标签等信息
- 任务有状态管理：待办、进行中、已完成、已取消
- 支持任务状态的流转：开始任务、完成任务、取消任务
- 支持按状态、负责人、优先级查询任务
- 支持更新任务信息

**注意观察 AO MCP Server 的资源或提示**，这些资源包含了如何使用 iTerm MCP Server 进行测试的详细说明，包括：
- AO 进程启动和配置
- 应用代码加载
- 测试用例执行方法
- 结果验证技巧

你应该使用 iTerm MCP Server 对实现代码进行测试，并且让测试通过。如果有问题，请修复代码，然后重新测试。

最后将整个过程和总结为 `README.md` 文档。
```

---

## DDDML 驱动开发 AO Dapp 示例代码库

### A-AO-Demo 示例库

**项目地址**: https://github.com/dddappp/A-AO-Demo

这是一个**综合性**的 AO 应用示例库，主要特点：

#### 🎯 核心价值
- **低代码开发理念**: 展示如何使用低代码方法开发复杂的 AO 去中心化应用
- **完整应用架构**: 包含完整的应用示例，从简单到复杂
- **最佳实践指南**: 详细的开发文档和使用说明


### AI-Assisted-AO-Dapp-Example 示例库

**项目地址**: https://github.com/dddappp/AI-Assisted-AO-Dapp-Example

这是一个**AI辅助开发**的 AO 应用示例库，专注于展示 AI 如何助力 AO 开发：

#### 🎯 核心价值
- **AI辅助开发**: 展示 AI 如何帮助编写业务逻辑代码
- **简化开发流程**: 演示低代码平台如何改变 Dapp 开发
- **渐进式学习**: 从简单示例开始，逐步深入

### 💡 建议的使用路径

1. **如果你是 AO 新手**: 从 `AI-Assisted-AO-Dapp-Example` 开始，体验 DSL + AI 辅助开发的便利性
2. **如果你想深入学习**: 参考 `A-AO-Demo`，了解完整的 AO 应用架构
