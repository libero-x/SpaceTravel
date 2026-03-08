# 🚀 GitHub自动更新指南

## 📋 文件说明

### 自动更新脚本：
1. **`一键更新到GitHub.bat`** - 最简单的一键更新脚本
2. **`update_to_github.bat`** - 批处理脚本（基础版）
3. **`update_to_github.ps1`** - PowerShell脚本（高级版）

### 使用方法：

#### 方法1：一键更新（推荐）
1. 双击运行 **`一键更新到GitHub.bat`**
2. 按照提示操作
3. 等待完成

#### 方法2：手动Git命令
```bash
cd F:\Openclaw_libero
git add .
git commit -m "更新说明"
git push origin main
```

## 🔧 前提条件

### 1. 安装Git
- 下载：https://git-scm.com/
- 安装时选择"Git from the command line"

### 2. 配置Git（第一次使用）
```bash
git config --global user.name "你的名字"
git config --global user.email "你的邮箱"
```

### 3. GitHub访问权限
- 需要能正常访问GitHub
- 可能需要登录验证

## 🚨 常见问题

### Q1: 提示"Git未安装"
**解决：** 安装Git并重启电脑

### Q2: 推送失败，需要登录
**解决：**
```bash
# 使用HTTPS方式（需要输入用户名密码）
git remote set-url origin https://github.com/libero-x/SpaceTravel.git

# 或者使用SSH方式（需要配置SSH密钥）
git remote set-url origin git@github.com:libero-x/SpaceTravel.git
```

### Q3: 提示权限不足
**解决：**
1. 确认你有仓库的写入权限
2. 检查GitHub账户状态
3. 尝试使用Personal Access Token

### Q4: GitHub Pages没有立即更新
**解决：**
- GitHub Pages有1-2分钟的缓存延迟
- 清除浏览器缓存
- 访问：https://libero-x.github.io/SpaceTravel/?v=随机数

## ⚡ 高级功能

### 定时自动更新（Windows任务计划）
1. 打开"任务计划程序"
2. 创建基本任务
3. 设置触发器（如每天12:00）
4. 操作：启动程序 `F:\Openclaw_libero\一键更新到GitHub.bat`

### 文件变更监控
可以设置脚本监控文件变化，自动提交：
```powershell
# 监控index.html文件变化
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = "F:\Openclaw_libero"
$watcher.Filter = "*.html"
$watcher.EnableRaisingEvents = $true
```

## 📊 更新日志模板

建议的提交信息格式：
```
✨ 新功能：添加搜索功能
🐛 修复：移动端布局问题
🎨 优化：改进颜色方案
📱 响应式：优化小屏幕显示
```

## 🔒 安全提醒

1. **不要提交敏感信息**（密码、API密钥等）
2. **定期备份**本地文件
3. **测试后再推送**到主分支
4. **使用.gitignore**忽略不需要的文件

## 🌐 网站状态检查

更新后检查：
1. https://libero-x.github.io/SpaceTravel/ （主站）
2. https://github.com/libero-x/SpaceTravel/deployments （部署状态）
3. https://github.com/libero-x/SpaceTravel/actions （构建日志）

## 🆘 技术支持

如果遇到问题：
1. 查看错误信息
2. 检查网络连接
3. 验证Git配置
4. 联系皮皮虾 🦐 获取帮助

---

**最后更新：** 2026-03-08  
**维护者：** 皮皮虾 🦐  
**项目：** 宇宙航行论坛  
**状态：** ✅ 自动更新系统就绪