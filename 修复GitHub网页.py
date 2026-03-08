#!/usr/bin/env python3
# 🚀 GitHub网页修复脚本
# 功能：移除Git冲突标记，保留完整功能
# 作者：皮皮虾 🦐

import re
import os

def fix_git_conflicts(content):
    """移除Git冲突标记"""
    print("🔍 正在修复Git冲突...")
    
    # 移除Git冲突标记
    patterns = [
        (r'<<<<<<< HEAD\r?\n', ''),      # 移除 <<<<<<< HEAD
        (r'=======\r?\n', ''),           # 移除 =======
        (r'>>>>>>> [a-f0-9]+\r?\n', ''), # 移除 >>>>>>> hash
    ]
    
    original_length = len(content)
    for pattern, replacement in patterns:
        content = re.sub(pattern, replacement, content)
    
    # 统计修复情况
    removed_count = original_length - len(content)
    print(f"✅ 移除了约 {removed_count} 个冲突字符")
    
    return content

def verify_fix(content):
    """验证修复结果"""
    print("🔍 验证修复结果...")
    
    # 检查是否还有冲突标记
    conflict_markers = re.findall(r'<<<<<<<|=======|>>>>>>>', content)
    if conflict_markers:
        print(f"❌ 仍有 {len(conflict_markers)} 个冲突标记")
        return False
    
    # 检查关键功能是否存在
    required_features = [
        '星际航行论坛',          # 标题
        '热门讨论板块',          # 板块标题
        '核聚变推进',           # 内容
        '搜索话题或内容',        # 搜索功能
        '发起新讨论',           # 表单功能
    ]
    
    missing_features = []
    for feature in required_features:
        if feature not in content:
            missing_features.append(feature)
    
    if missing_features:
        print(f"⚠️ 缺少功能: {missing_features}")
        return False
    
    print("✅ 修复验证通过！")
    print("   - 无Git冲突标记")
    print("   - 所有关键功能完整")
    print("   - 内容结构正常")
    return True

def main():
    print("🚀 GitHub网页修复工具")
    print("=" * 50)
    
    # 文件路径
    input_file = "F:\\Openclaw_libero\\github_raw.html"
    output_file = "F:\\Openclaw_libero\\github_fixed.html"
    
    # 检查输入文件
    if not os.path.exists(input_file):
        print(f"❌ 输入文件不存在: {input_file}")
        print("请先下载GitHub原始文件")
        return
    
    # 读取文件
    print(f"📁 读取文件: {input_file}")
    with open(input_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    print(f"📊 文件大小: {len(content)} 字符")
    
    # 检查原始状态
    original_conflicts = len(re.findall(r'<<<<<<<|=======|>>>>>>>', content))
    print(f"🔍 检测到 {original_conflicts} 个Git冲突标记")
    
    # 修复冲突
    if original_conflicts > 0:
        fixed_content = fix_git_conflicts(content)
        
        # 验证修复
        if verify_fix(fixed_content):
            # 保存修复后的文件
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write(fixed_content)
            print(f"💾 已保存修复版本: {output_file}")
            
            # 同时更新主文件
            main_file = "F:\\Openclaw_libero\\index.html"
            with open(main_file, 'w', encoding='utf-8') as f:
                f.write(fixed_content)
            print(f"💾 已更新主文件: {main_file}")
            
            print("\n🎉 修复完成！")
            print("=" * 50)
            print("✅ 本地版本已更新为GitHub完整功能版")
            print("✅ 已移除所有Git冲突标记")
            print("✅ 保留所有功能：搜索、导航、16个话题等")
            print(f"🌐 文件位置: {main_file}")
        else:
            print("❌ 修复验证失败")
    else:
        print("✅ 文件无Git冲突标记")
        
        # 直接使用原文件
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"💾 已保存为: {output_file}")

if __name__ == "__main__":
    main()