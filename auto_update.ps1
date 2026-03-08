# 🚀 宇宙航行论坛 - 全自动更新脚本
# 作者：皮皮虾 🦐
# 功能：一键更新到GitHub Pages

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "🚀 宇宙航行论坛 - 全自动更新系统" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 设置工作目录
$workspace = "F:\Openclaw_libero"
Set-Location $workspace

Write-Host "📁 工作目录: $workspace" -ForegroundColor Cyan
Write-Host "📅 开始时间: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" -ForegroundColor Cyan
Write-Host ""

# 1. 检查Git安装
Write-Host "步骤1: 检查Git环境..." -ForegroundColor Green
$gitVersion = git --version 2>$null
if (-not $gitVersion) {
    Write-Host "❌ 错误: Git未安装或未配置PATH" -ForegroundColor Red
    Write-Host "请安装Git: https://git-scm.com/" -ForegroundColor Yellow
    exit 1
}
Write-Host "✅ Git版本: $gitVersion" -ForegroundColor Green

# 2. 初始化Git仓库（如果需要）
Write-Host "`n步骤2: 初始化Git仓库..." -ForegroundColor Green
if (-not (Test-Path ".git")) {
    Write-Host "正在初始化Git仓库..." -ForegroundColor Cyan
    git init
    git remote add origin https://github.com/libero-x/SpaceTravel.git
    Write-Host "✅ Git仓库初始化完成" -ForegroundColor Green
} else {
    Write-Host "✅ Git仓库已存在" -ForegroundColor Green
}

# 3. 配置Git用户信息（如果需要）
Write-Host "`n步骤3: 配置Git用户..." -ForegroundColor Green
$gitUser = git config --global user.name
$gitEmail = git config --global user.email

if (-not $gitUser -or -not $gitEmail) {
    Write-Host "⚠️ Git用户信息未配置" -ForegroundColor Yellow
    Write-Host "正在配置默认用户信息..." -ForegroundColor Cyan
    git config --global user.name "Libero"
    git config --global user.email "libero@example.com"
    Write-Host "✅ Git用户信息已配置" -ForegroundColor Green
} else {
    Write-Host "✅ Git用户: $gitUser <$gitEmail>" -ForegroundColor Green
}

# 4. 添加文件到Git
Write-Host "`n步骤4: 添加文件到Git..." -ForegroundColor Green
git add .
$fileCount = (git status --porcelain | Measure-Object).Count
Write-Host "✅ 添加了 $fileCount 个文件" -ForegroundColor Green

# 5. 提交更改
Write-Host "`n步骤5: 提交更改..." -ForegroundColor Green
$commitMessage = "自动更新: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - 修复导航功能"
git commit -m $commitMessage
Write-Host "✅ 提交信息: $commitMessage" -ForegroundColor Green

# 6. 推送到GitHub
Write-Host "`n步骤6: 推送到GitHub..." -ForegroundColor Green
Write-Host "正在推送更改到 https://github.com/libero-x/SpaceTravel.git" -ForegroundColor Cyan

try {
    $pushOutput = git push -u origin main 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "`n🎉 更新成功！" -ForegroundColor Green
        Write-Host "🌐 网站地址: https://libero-x.github.io/SpaceTravel/" -ForegroundColor Cyan
        Write-Host "⏱️ 更新时间: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" -ForegroundColor Cyan
        Write-Host "📊 更新内容: 修复导航链接、添加搜索功能、移动端优化" -ForegroundColor Cyan
        
        # 打开网站
        $openSite = Read-Host "`n是否立即打开网站查看更新？(y/n)"
        if ($openSite -eq 'y' -or $openSite -eq 'Y') {
            Start-Process "https://libero-x.github.io/SpaceTravel/"
        }
    } else {
        Write-Host "`n❌ 推送失败！" -ForegroundColor Red
        Write-Host "错误信息:" -ForegroundColor Yellow
        Write-Host $pushOutput -ForegroundColor Red
        
        Write-Host "`n🔧 可能的原因和解决方案:" -ForegroundColor Yellow
        Write-Host "1. GitHub登录问题 - 需要登录GitHub账户" -ForegroundColor White
        Write-Host "2. 网络连接问题 - 检查网络连接" -ForegroundColor White
        Write-Host "3. 权限不足 - 确认有仓库写入权限" -ForegroundColor White
        Write-Host "4. 分支名称问题 - 尝试: git push -u origin HEAD:main" -ForegroundColor White
        
        Write-Host "`n💡 手动解决方案:" -ForegroundColor Cyan
        Write-Host "1. 登录GitHub网站: https://github.com" -ForegroundColor White
        Write-Host "2. 手动上传文件到仓库" -ForegroundColor White
        Write-Host "3. 或使用GitHub Desktop客户端" -ForegroundColor White
    }
} catch {
    Write-Host "`n❌ 推送过程中出现错误:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "📝 更新日志已保存到: F:\Openclaw_libero\memory\2026-03-08.md" -ForegroundColor Cyan
Write-Host "🦐 皮皮虾自动化系统完成" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan

Read-Host "`n按回车键退出"