#!/bin/bash
# =====================================================================
# سكربت رفع متجر الملف على GitHub
# =====================================================================
set -e

echo "🚀 رفع متجر الملف على GitHub"
echo "================================"
echo ""

# التحقق من وجود git
if ! command -v git &> /dev/null; then
  echo "❌ Git غير مُثبّت. ثبّته من: https://git-scm.com/downloads"
  exit 1
fi

# طلب معلومات المستخدم
read -p "📝 أدخل اسم مستخدم GitHub الخاص بك: " GITHUB_USER
read -p "📝 أدخل اسم المستودع (افتراضي: matjar-almailf): " REPO_NAME
REPO_NAME=${REPO_NAME:-matjar-almailf}

# تعيين قيم افتراضية
PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
PARENT_DIR="$(dirname "$PROJECT_DIR")"
TARGET_DIR="$PARENT_DIR/$REPO_NAME"

echo ""
echo "📋 ملخص العملية:"
echo "   - مستخدم GitHub: $GITHUB_USER"
echo "   - اسم المستودع: $REPO_NAME"
echo "   - المسار: $TARGET_DIR"
echo ""

read -p "هل تريد المتابعة؟ (y/n): " CONFIRM
if [[ $CONFIRM != "y" && $CONFIRM != "Y" ]]; then
  echo "❌ تم الإلغاء"
  exit 0
fi

# نسخ المشروع
echo ""
echo "📥 نسخ المشروع..."
cp -r "$PROJECT_DIR" "$TARGET_DIR"
cd "$TARGET_DIR"

# إزالة الملفات غير الضرورية
rm -rf node_modules .next .git db/custom.db .env .zscripts download upload skills 2>/dev/null || true
rm -f dev.log server.log 2>/dev/null || true

# تهيئة Git
echo "🔧 تهيئة Git..."
git init
git config user.name "$GITHUB_USER"
git config user.email "$GITHUB_USER@users.noreply.github.com"
git add .
git commit -m "🎉 Initial commit: متجر الملف v1.0.0

متجر منتجات رقمية احترافي بالعربية مع:
- دفع عبر بريدي موب (CCP)
- لوحة تحكم متكاملة
- نظام إشعارات بريدية
- إدارة المنتجات والطلبات

المؤلف: $GITHUB_USER
الترخيص: MIT"

git branch -M main

# إضافة الـ remote
echo "🌐 ربط المستودع بـ GitHub..."
git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"

echo ""
echo "✅ المشروع جاهز للرفع!"
echo ""
echo "📌 الخطوات التالية:"
echo ""
echo "1️⃣ اذهب إلى GitHub وأنشئ مستودعاً جديداً:"
echo "   https://github.com/new"
echo "   - الاسم: $REPO_NAME"
echo "   - Visibility: Private (يُفضّل)"
echo "   - لا تختر: README, .gitignore, license"
echo ""
echo "2️⃣ ارجع لهنا واضغط Enter للرفع"
echo ""
read -p "هل أنشأت المستودع؟ اضغط Enter للرفع..."

echo ""
echo "📤 رفع المشروع..."
git push -u origin main

echo ""
echo "🎉 تم الرفع بنجاح!"
echo ""
echo "🌐 رابط المستودع:"
echo "   https://github.com/$GITHUB_USER/$REPO_NAME"
echo ""
echo "📖 لمعرفة كيفية النشر على Vercel، راجع:"
echo "   https://github.com/$GITHUB_USER/$REPO_NAME/blob/main/README.md#-النشر"
