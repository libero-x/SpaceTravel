@echo off
chcp 65001 >nul
echo.
echo ╔══════════════════════════════════════╗
echo ║      🚀 宇宙航行论坛一键更新         ║
echo ║      🌌 自动部署到GitHub Pages      ║
echo ╚══════════════════════════════════════╝
echo.

REM 设置颜色
color 0B

REM 检查必要文件
if not exist "index.html" (
    echo ❌ 错误：找不到 index.html 文件！
    pause
    exit /b 1
)

echo 📁 工作目录：F:\Openclaw_libero
echo 📅 当前时间：%date% %time%
echo.

REM 执行Git操作
echo 🔄 正在更新到GitHub...
echo.

REM 使用PowerShell脚本（如果有）
if exist "update_to_github.ps1" (
    powershell -ExecutionPolicy Bypass -File "update_to_github.ps1"
) else (
    REM 简单的Git命令
    cd /d "F:\Openclaw_libero"
    
    echo 步骤1：初始化Git（如果需要）...
    if not exist ".git" (
        git init
        git remote add origin https://github.com/libero-x/SpaceTravel.git
    )
    
    echo 步骤2：添加文件...
    git add .
    
    echo 步骤3：提交更改...
    git commit -m "自动更新：%date% %time%"
    
    echo 步骤4：推送到GitHub...
    git push origin main
    
    if %errorlevel% equ 0 (
        echo.
        echo ✅ 更新成功！
        echo 🌐 网站已更新：https://libero-x.github.io/SpaceTravel/
        echo.
        echo ⚠️ 注意：GitHub Pages可能需要1-2分钟刷新
    ) else (
        echo.
        echo ❌ 更新失败！
        echo 请检查：
        echo 1. Git是否安装并配置
        echo 2. GitHub登录状态
        echo 3. 网络连接
    )
)

echo.
echo ════════════════════════════════════════
echo 按任意键退出...
pause >nul