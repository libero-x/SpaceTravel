# 🚀 宇宙航行论坛 - 部署指南

## 第一步：准备文件

我已经为你准备好了所有文件：
1. `cosmic_forum.html` - 主网页文件
2. `README.md` - 项目说明
3. `index.html` - GitHub Pages需要的主页文件（重命名）

## 第二步：创建GitHub仓库

**你需要做的：**
1. 登录 GitHub (https://github.com)
2. 点击右上角 "+" → "New repository"
3. 填写仓库信息：
   - **Repository name:** `cosmic-forum` (建议)
   - **Description:** "宇宙航行主题论坛 - 讨论星际旅行技术和未来路线"
   - 选择 **Public**
   - **不要勾选** "Initialize this repository with a README"
4. 点击 "Create repository"

## 第三步：上传文件

创建仓库后，GitHub会显示上传页面。**按这个顺序操作：**

### 方法A：简单拖拽（推荐）
1. 将工作空间中的以下文件**拖拽**到GitHub上传区域：
   - `cosmic_forum.html` → 重命名为 `index.html` (重要！)
   - `README.md`
2. 点击 "Commit changes"

### 方法B：使用Git命令行
```bash
# 如果你熟悉Git，可以用这些命令
git init
git add .
git commit -m "Initial commit: Cosmic Forum website"
git branch -M main
git remote add origin https://github.com/你的用户名/cosmic-forum.git
git push -u origin main
```

## 第四步：启用GitHub Pages

1. 进入仓库的 **Settings** 标签
2. 左侧找到 **Pages**
3. 在 **Source** 部分：
   - Branch: 选择 `main`
   - Folder: 选择 `/ (root)`
4. 点击 **Save**
5. 等待1-2分钟，刷新页面
6. 你会看到绿色的成功消息和你的网站地址：
   `https://你的用户名.github.io/cosmic-forum/`

## 第五步：访问你的论坛

打开这个网址，你的宇宙航行论坛就正式上线了！

## 额外功能（可选）

### 自定义域名
如果你想用 `cosmic-forum.com` 这样的域名：
1. 购买域名（Namecheap, GoDaddy等）
2. 在域名设置中添加CNAME记录指向GitHub
3. 在GitHub Pages设置中填写自定义域名

### 添加Google Analytics
跟踪访问者数据：
1. 注册Google Analytics
2. 获取跟踪代码
3. 添加到 `index.html` 的 `<head>` 部分

## 技术支持

如果遇到问题：
1. 检查文件名是否正确（必须是 `index.html`）
2. 确保仓库是Public
3. 等待GitHub Pages完全部署（可能需要几分钟）
4. 清除浏览器缓存再访问

---

**你的网站将在：** `https://你的用户名.github.io/cosmic-forum/`

**预计时间：** 5-10分钟完成所有步骤

**皮皮虾 🦐 会在这里等待，随时帮你解决问题！**