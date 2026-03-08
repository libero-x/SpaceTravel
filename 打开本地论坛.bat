@echo off
chcp 65001 >nul
title 🚀 打开本地宇宙航行论坛
color 0B

echo.
echo ╔══════════════════════════════════════════╗
echo ║        🚀 宇宙航行论坛 - 本地版本       ║
echo ║        🦐 皮皮虾修复完成版             ║
echo ╚══════════════════════════════════════════╝
echo.
echo 📁 文件位置: F:\Openclaw_libero\index.html
echo 📅 打开时间: %date% %time%
echo.

REM 检查文件是否存在
if not exist "index.html" (
    echo ❌ 错误: 找不到 index.html 文件！
    pause
    exit /b 1
)

echo 🔄 正在打开本地论坛...
echo.

REM 尝试用默认浏览器打开
start "" "index.html"

if errorlevel 0 (
    echo ✅ 论坛已打开！
    echo.
    echo 📋 本地版本特色:
    echo ✅ 无Git冲突标记
    echo ✅ 无乱码问题  
    echo ✅ 完整论坛功能
    echo ✅ 专业宇宙航行内容
    echo.
    echo 🌐 在线版本状态:
    echo ⚠️ 等待GitHub更新
    echo 🔗 https://libero-x.github.io/SpaceTravel/
) else (
    echo ❌ 打开失败！
    echo.
    echo 💡 手动打开方法:
    echo 1. 打开文件夹: F:\Openclaw_libero\
    echo 2. 右键点击 index.html
    echo 3. 选择"打开方式" → 你的浏览器
)

echo.
echo ════════════════════════════════════════════
echo 🦐 皮皮虾本地修复版
echo 按任意键退出...
pause >nul