@echo off
chcp 65001 >nul
title 🚀 cosmic_forum.html 更新到GitHub
color 0B

echo.
echo ╔══════════════════════════════════════════╗
echo ║        🚀 cosmic_forum.html 更新        ║
echo ║        🦐 完整论坛版本上传             ║
echo ╚══════════════════════════════════════════╝
echo.
echo 📅 更新时间: %date% %time%
echo 📁 工作目录: F:\Openclaw_libero
echo.

REM 进入工作目录
cd /d "F:\Openclaw_libero"

echo 🔄 步骤1: 检查文件状态...
if not exist "cosmic_forum.html" (
    echo ❌ 错误: 找不到 cosmic_forum.html
    pause
    exit /b 1
)

echo ✅ cosmic_forum.html 存在 (15,494 字节)

echo.
echo 🔄 步骤2: 创建备份...
set backup_name=cosmic_forum_backup_%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%.html
copy "cosmic_forum.html" "%backup_name%"
echo ✅ 已备份为: %backup_name%

echo.
echo 🔄 步骤3: 替换主文件...
copy "cosmic_forum.html" "index.html" /Y
echo ✅ 已将 cosmic_forum.html 复制为 index.html

echo.
echo 🔄 步骤4: 检查Git状态...
git status

echo.
echo 🔄 步骤5: 提交更改...
git add .
git commit -m "更新: 使用完整的cosmic_forum.html版本 - %date% %time%"

echo.
echo 🔄 步骤6: 推送到GitHub...
echo 正在推送到: https://github.com/libero-x/SpaceTravel.git
echo.

git push origin main

if errorlevel 0 (
    echo.
    echo 🎉 更新成功！
    echo.
    echo 📊 更新内容:
    echo ✅ 完整的宇宙航行论坛
    echo ✅ 搜索功能
    echo ✅ 导航菜单
    echo ✅ 论坛统计
    echo ✅ 在线用户列表
    echo ✅ 新话题表单
    echo ✅ JavaScript交互
    echo.
    echo 🌐 网站地址: https://libero-x.github.io/SpaceTravel/
    echo ⏱️ 更新时间: %date% %time%
    echo.
    echo ⚠️ 注意: 请等待1-5分钟让GitHub Pages更新
    echo.
    set /p open="是否立即打开网站？(y/n): "
    if /i "%open%"=="y" (
        start "" "https://libero-x.github.io/SpaceTravel/?v=cosmic_forum更新"
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
    echo 2. 稍后重试运行此脚本
    echo 3. 或手动上传文件到GitHub
)

echo.
echo ════════════════════════════════════════════
echo 📝 本地备份: %backup_name%
echo 🦐 皮皮虾更新系统完成
echo 按任意键退出...
pause >nul