@echo off
chcp 65001 >nul
title 🚀 宇宙航行论坛 - 自动更新到GitHub
color 0B

echo.
echo ╔══════════════════════════════════════════╗
echo ║        🚀 宇宙航行论坛更新系统          ║
echo ║        🌌 一键部署到GitHub Pages       ║
echo ╚══════════════════════════════════════════╝
echo.
echo 📁 工作目录: F:\Openclaw_libero
echo 📅 开始时间: %date% %time%
echo.

REM 检查Git是否安装
where git >nul 2>nul
if errorlevel 1 (
    echo ❌ 错误: Git未安装！
    echo 请先安装Git: https://git-scm.com/
    pause
    exit /b 1
)

REM 进入工作目录
cd /d "F:\Openclaw_libero"

echo 🔄 正在初始化Git仓库...
if not exist ".git" (
    git init
    git remote add origin https://github.com/libero-x/SpaceTravel.git
    echo ✅ Git仓库初始化完成
) else (
    echo ✅ Git仓库已存在
)

echo.
echo 📁 添加文件到Git...
git add .

echo.
echo 💾 提交更改...
set "commit_msg=自动更新: %date% %time% - 修复导航功能"
git commit -m "%commit_msg%"

echo.
echo 🔄 推送到GitHub...
echo 正在推送到: https://github.com/libero-x/SpaceTravel.git
echo.

git push -u origin main

if errorlevel 0 (
    echo.
    echo 🎉 更新成功！
    echo 🌐 网站地址: https://libero-x.github.io/SpaceTravel/
    echo ⏱️ 更新时间: %date% %time%
    echo 📊 更新内容: 修复导航链接、添加搜索功能
    echo.
    echo ⚠️ 注意: GitHub Pages可能需要1-2分钟刷新
    echo.
    set /p open="是否立即打开网站？(y/n): "
    if /i "%open%"=="y" (
        start "" "https://libero-x.github.io/SpaceTravel/"
    )
) else (
    echo.
    echo ❌ 推送失败！
    echo.
    echo 🔧 可能的原因:
    echo 1. GitHub登录问题 - 需要登录GitHub账户
    echo 2. 网络连接问题 - 检查网络连接
    echo 3. 权限不足 - 确认有仓库写入权限
    echo.
    echo 💡 解决方案:
    echo 1. 登录GitHub: https://github.com
    echo 2. 手动上传文件到仓库
    echo 3. 或使用GitHub Desktop客户端
)

echo.
echo ════════════════════════════════════════════
echo 🦐 皮皮虾自动化系统完成
echo 按任意键退出...
pause >nul