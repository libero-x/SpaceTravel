@echo off
chcp 65001 >nul
title 🔍 cosmic_forum.html 检查工具
color 0E

echo.
echo ╔══════════════════════════════════════════╗
echo ║        🔍 cosmic_forum.html 检查        ║
echo ║        🦐 确保文件无问题               ║
echo ╚══════════════════════════════════════════╝
echo.
echo 📅 检查时间: %date% %time%
echo 📁 文件位置: F:\Openclaw_libero\cosmic_forum.html
echo.

REM 进入工作目录
cd /d "F:\Openclaw_libero"

echo 🔍 检查1: 文件是否存在...
if not exist "cosmic_forum.html" (
    echo ❌ 错误: 找不到 cosmic_forum.html
    pause
    exit /b 1
)

for %%F in ("cosmic_forum.html") do (
    set size=%%~zF
)
echo ✅ 文件存在，大小: %size% 字节

echo.
echo 🔍 检查2: 检查Git冲突标记...
findstr /C:">>>>>>>" "cosmic_forum.html" >nul
if errorlevel 1 (
    echo ✅ 无 >>>>>>> Git冲突标记
) else (
    echo ❌ 发现 >>>>>>> Git冲突标记
)

findstr /C:"<<<<<<<" "cosmic_forum.html" >nul
if errorlevel 1 (
    echo ✅ 无 <<<<<<< Git冲突标记
) else (
    echo ❌ 发现 <<<<<<< Git冲突标记
)

findstr /C:"=======" "cosmic_forum.html" >nul
if errorlevel 1 (
    echo ✅ 无 ======= Git冲突标记
) else (
    echo ❌ 发现 ======= Git冲突标记
)

echo.
echo 🔍 检查3: 检查关键功能...
findstr /C:"星际航行论坛" "cosmic_forum.html" >nul && echo ✅ 标题正常
findstr /C:"搜索话题或内容" "cosmic_forum.html" >nul && echo ✅ 搜索功能存在
findstr /C:"发起新讨论" "cosmic_forum.html" >nul && echo ✅ 表单功能存在
findstr /C:"热门讨论板块" "cosmic_forum.html" >nul && echo ✅ 论坛板块存在
findstr /C:"核聚变推进" "cosmic_forum.html" >nul && echo ✅ 论坛内容存在

echo.
echo 🔍 检查4: 文件编码...
powershell -Command "
$content = Get-Content 'cosmic_forum.html' -Raw
if ($content -match '[^\x00-\x7F]' -and $content -notmatch '[\u4e00-\u9fff]') {
    Write-Host '⚠️ 可能编码问题' -ForegroundColor Yellow
} else {
    Write-Host '✅ 编码正常' -ForegroundColor Green
}
"

echo.
echo ════════════════════════════════════════════
echo 📊 检查结果总结:
echo.
if exist "检查结果.txt" del "检查结果.txt"

(
echo cosmic_forum.html 检查报告
echo ========================
echo 检查时间: %date% %time%
echo 文件大小: %size% 字节
echo.
echo Git冲突检查:
findstr /C:">>>>>>>" "cosmic_forum.html" >nul && echo ❌ 有 >>>>>>> 标记 || echo ✅ 无 >>>>>>> 标记
findstr /C:"<<<<<<<" "cosmic_forum.html" >nul && echo ❌ 有 <<<<<<< 标记 || echo ✅ 无 <<<<<<< 标记
findstr /C:"=======" "cosmic_forum.html" >nul && echo ❌ 有 ======= 标记 || echo ✅ 无 ======= 标记
echo.
echo 功能检查:
findstr /C:"星际航行论坛" "cosmic_forum.html" >nul && echo ✅ 标题正常 || echo ❌ 标题缺失
findstr /C:"搜索话题或内容" "cosmic_forum.html" >nul && echo ✅ 搜索功能存在 || echo ❌ 搜索功能缺失
findstr /C:"发起新讨论" "cosmic_forum.html" >nul && echo ✅ 表单功能存在 || echo ❌ 表单功能缺失
) > "检查结果.txt"

type "检查结果.txt"

echo.
echo 📝 详细报告已保存到: 检查结果.txt
echo 🦐 皮皮虾检查完成
echo 按任意键退出...
pause >nul