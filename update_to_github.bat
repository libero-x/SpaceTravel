@echo off
echo ========================================
echo 🚀 宇宙航行论坛 - 自动更新到GitHub
echo ========================================
echo.

REM 检查Git是否安装
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ 错误：Git未安装！
    echo 请先安装Git：https://git-scm.com/
    pause
    exit /b 1
)

REM 进入工作目录
cd /d "F:\Openclaw_libero"

REM 检查是否是Git仓库
if not exist ".git" (
    echo ⚠️ 当前目录不是Git仓库
    echo 正在初始化Git仓库...
    git init
    git remote add origin https://github.com/libero-x/SpaceTravel.git
    echo ✅ Git仓库初始化完成
)

REM 添加所有文件
echo.
echo 📁 添加文件到Git...
git add .

REM 提交更改
echo.
echo 💾 提交更改...
set /p commit_msg="请输入提交信息（直接回车使用默认信息）: "
if "%commit_msg%"=="" (
    set commit_msg="自动更新：%date% %time%"
)
git commit -m %commit_msg%

REM 推送到GitHub
echo.
echo 🔄 推送到GitHub...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ✅ 更新成功！
    echo 🌐 网站地址：https://libero-x.github.io/SpaceTravel/
    echo 📅 更新时间：%date% %time%
) else (
    echo.
    echo ❌ 推送失败！
    echo 可能的原因：
    echo 1. GitHub登录问题
    echo 2. 网络连接问题
    echo 3. 权限不足
)

echo.
echo ========================================
echo 按任意键退出...
pause >nul