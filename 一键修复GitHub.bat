@echo off
chcp 65001 >nul
title 🚀 宇宙航行论坛 - GitHub一键修复
color 0B

echo.
echo ╔══════════════════════════════════════════╗
echo ║        🚀 GitHub问题一键修复            ║
echo ║        🔧 解决冲突和更新问题           ║
echo ╚══════════════════════════════════════════╝
echo.
echo 📅 修复时间: %date% %time%
echo.

REM 进入工作目录
cd /d "F:\Openclaw_libero"

echo 🔄 步骤1: 检查当前状态...
git status

echo.
echo 🔄 步骤2: 备份原文件...
if exist "index_backup.html" del "index_backup.html"
if exist "index.html" copy "index.html" "index_backup.html"

echo.
echo 🔄 步骤3: 使用干净版本...
if exist "clean_update.html" (
    copy "clean_update.html" "index.html"
    echo ✅ 已使用干净版本
) else (
    echo ⚠️ 干净版本不存在，使用当前版本
)

echo.
echo 🔄 步骤4: 提交更改...
git add .
git commit -m "一键修复: 清除Git冲突，确保正常显示 - %date% %time%"

echo.
echo 🔄 步骤5: 强制推送到GitHub...
echo 正在推送到: https://github.com/libero-x/SpaceTravel.git
echo.

git push -f origin main

if errorlevel 0 (
    echo.
    echo 🎉 修复成功！
    echo 🌐 网站地址: https://libero-x.github.io/SpaceTravel/
    echo ⏱️ 更新时间: %date% %time%
    echo.
    echo ⚠️ 注意: 请等待1-3分钟让GitHub Pages更新
    echo.
    set /p open="是否立即打开网站？(y/n): "
    if /i "%open%"=="y" (
        start "" "https://libero-x.github.io/SpaceTravel/?v=修复完成"
    )
) else (
    echo.
    echo ❌ 推送失败！
    echo.
    echo 🔧 可能的原因:
    echo 1. 网络连接问题
    echo 2. GitHub服务暂时不可用
    echo 3. 需要重新登录GitHub
    echo.
    echo 💡 解决方案:
    echo 1. 检查网络连接
    echo 2. 稍后重试
    echo 3. 或手动上传文件到GitHub
)

echo.
echo ════════════════════════════════════════════
echo 📝 本地备份: index_backup.html
echo 🦐 皮皮虾修复系统完成
echo 按任意键退出...
pause >nul