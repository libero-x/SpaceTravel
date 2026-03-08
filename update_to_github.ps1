# 🚀 宇宙航行论坛 - 自动更新到GitHub (PowerShell版本)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "🚀 宇宙航行论坛 - 自动更新到GitHub" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 检查Git是否安装
$gitPath = Get-Command git -ErrorAction SilentlyContinue
if (-not $gitPath) {
    Write-Host "❌ 错误：Git未安装！" -ForegroundColor Red
    Write-Host "请先安装Git：https://git-scm.com/" -ForegroundColor Yellow
    Read-Host "按回车键退出"
    exit 1
}

# 进入工作目录
Set-Location "F:\Openclaw_libero"

# 检查是否是Git仓库
if (-not (Test-Path ".git")) {
    Write-Host "⚠️ 当前目录不是Git仓库" -ForegroundColor Yellow
    Write-Host "正在初始化Git仓库..." -ForegroundColor Cyan
    git init
    git remote add origin https://github.com/libero-x/SpaceTravel.git
    Write-Host "✅ Git仓库初始化完成" -ForegroundColor Green
}

# 显示更改状态
Write-Host ""
Write-Host "📊 当前更改状态：" -ForegroundColor Cyan
git status

# 添加所有文件
Write-Host ""
Write-Host "📁 添加文件到Git..." -ForegroundColor Cyan
git add .

# 提交更改
Write-Host ""
Write-Host "💾 提交更改..." -ForegroundColor Cyan
$defaultMsg = "自动更新：$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
$commitMsg = Read-Host "请输入提交信息（直接回车使用默认信息）"
if ([string]::IsNullOrWhiteSpace($commitMsg)) {
    $commitMsg = $defaultMsg
}
git commit -m $commitMsg

# 推送到GitHub
Write-Host ""
Write-Host "🔄 推送到GitHub..." -ForegroundColor Cyan
$pushResult = git push -u origin main 2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ 更新成功！" -ForegroundColor Green
    Write-Host "🌐 网站地址：https://libero-x.github.io/SpaceTravel/" -ForegroundColor Cyan
    Write-Host "📅 更新时间：$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" -ForegroundColor Cyan
    
    # 打开网站
    $openSite = Read-Host "是否立即打开网站？(y/n)"
    if ($openSite -eq 'y' -or $openSite -eq 'Y') {
        Start-Process "https://libero-x.github.io/SpaceTravel/"
    }
} else {
    Write-Host ""
    Write-Host "❌ 推送失败！" -ForegroundColor Red
    Write-Host "错误信息：" -ForegroundColor Yellow
    Write-Host $pushResult -ForegroundColor Red
    Write-Host ""
    Write-Host "可能的原因：" -ForegroundColor Yellow
    Write-Host "1. GitHub登录问题" -ForegroundColor White
    Write-Host "2. 网络连接问题" -ForegroundColor White
    Write-Host "3. 权限不足" -ForegroundColor White
    Write-Host "4. 需要配置Git凭据" -ForegroundColor White
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Read-Host "按回车键退出"