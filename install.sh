#!/bin/bash

# Antigravity Agent Skills Auto-Installer
# Version: 1.0.0

# 1. 경로 설정 (기본값: ~/.gemini/antigravity/skills)
DEFAULT_TARGET_DIR="$HOME/.gemini/antigravity/skills"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "----------------------------------------------------"
echo "   Antigravity Agent Skills Auto-Installer (KR)     "
echo "----------------------------------------------------"

# 2. 설치 경로 확인
read -p "설치 경로를 입력하세요 (기본값: $DEFAULT_TARGET_DIR): " TARGET_DIR
TARGET_DIR="${TARGET_DIR:-$DEFAULT_TARGET_DIR}"

if [ ! -d "$TARGET_DIR" ]; then
    echo "[!] 경로가 존재하지 않습니다: $TARGET_DIR"
    read -p "새로 생성할까요? (y/n): " CREATE_DIR
    if [[ "$CREATE_DIR" == "y" || "$CREATE_DIR" == "Y" ]]; then
        mkdir -p "$TARGET_DIR"
    else
        echo "[X] 설치를 취소합니다."
        exit 1
    fi
fi

# 3. 백업 (옵션)
echo "[...] 기존 스킬 백업 중..."
BACKUP_NAME="skills_backup_$(date +%Y%m%d_%H%M%S).tar.gz"
tar -czf "$HOME/$BACKUP_NAME" -C "$(dirname "$TARGET_DIR")" "$(basename "$TARGET_DIR")" 2>/dev/null
echo "[+] 백업 완료: $HOME/$BACKUP_NAME"

# 4. 스킬 설치
echo "[...] 스킬 설치 중..."
# README.md, .git, install.sh 등을 제외하고 모든 폴더 복사
find "$REPO_DIR" -maxdepth 1 -type d -not -name "." -not -name ".git" -not -name "node_modules" | while read dir; do
    cp -R "$dir" "$TARGET_DIR/"
done

echo "[OK] 모든 안티그래비티 대리인 스킬이 설치되었습니다!"
echo ""
echo "설치 위치: $TARGET_DIR"
echo "이제 채팅창에서 에이전트를 호출해 보세요 (@선임개발자 등)"
echo "----------------------------------------------------"
