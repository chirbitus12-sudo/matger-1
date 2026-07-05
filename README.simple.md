# 🛍️ متجر الملف

> متجر منتجات رقمية بالعربية مع دفع CCP ولوحة تحكم

![Version](https://img.shields.io/badge/version-1.0.0-orange)
![License](https://img.shields.io/badge/license-MIT-blue)

---

## 🚀 التشغيل السريع

```bash
# 1. تثبيت الحزم
bun install

# 2. إعداد البيئة
cp .env.example .env
# عدّل القيم في .env

# 3. تهيئة قاعدة البيانات
bun run db:push

# 4. زرع بيانات تجريبية
bun run seed

# 5. تشغيل المشروع
bun run dev
```

افتح: **http://localhost:3000**

---

## 🔑 الدخول للوحة التحكم

```
البريد: fartougarso@gmail.com
كلمة المرور: QaqdHyTY6GF4hss
```

> ⚠️ غيّر كلمة المرور في ملف `.env` قبل النشر

---

## 📂 الصفحات الرئيسية

| الصفحة | الرابط | الوصف |
|--------|--------|-------|
| 🏠 المتجر | `/` | واجهة العميل |
| 🔐 تسجيل الدخول | `/admin/login` | دخول المدير |
| 📊 لوحة التحكم | `/admin` | الإحصائيات |
| 📦 المنتجات | `/admin/products` | إدارة المنتجات |
| 📋 الطلبات | `/admin/orders` | إدارة الطلبات |

---

## ✨ المميزات

**للعميل:**
- 🛒 تصفّح وشراء المنتجات
- 💳 دفع عبر بريدي موب (CCP)
- 📧 تأكيد الطلب بالبريد
- ⬇️ تحميل المنتج بعد الدفع

**للمدير:**
- 📊 إحصائيات شاملة
- 📦 إدارة المنتجات (إضافة/تعديل/حذف)
- 📋 إدارة الطلبات (تأكيد/إلغاء/حذف)
- 📧 إشعارات بريدية تلقائية

---

## 🛠️ التقنيات

- **Next.js 16** + React 19 + TypeScript
- **Tailwind CSS 4** + shadcn/ui
- **Prisma 6** + SQLite
- **JWT** + bcrypt للمصادقة
- **Nodemailer** للبريد

---

## ⚙️ متغيرات البيئة

أنشئ ملف `.env` بهذه القيم:

```env
DATABASE_URL="file:./db/custom.db"
JWT_SECRET="your-secret-key"
ADMIN_EMAIL="your@email.com"
ADMIN_PASSWORD="your-password"
NEXT_PUBLIC_SITE_URL="http://localhost:3000"
CCP_ACCOUNT_NUMBER="11833185"
CCP_KEY="04"
NEXT_PUBLIC_CCP_ACCOUNT_NUMBER="11833185"
NEXT_PUBLIC_CCP_KEY="04"
# SMTP (اختياري للتطوير)
SMTP_HOST="smtp.gmail.com"
SMTP_PORT="587"
SMTP_USER="your-email@gmail.com"
SMTP_PASS="your-app-password"
SMTP_FROM="متجر الملف <no-reply@yourdomain.com>"
```

---

## 📜 الأوامر

| الأمر | الوصف |
|------|-------|
| `bun run dev` | تشغيل المشروع |
| `bun run build` | بناء الإنتاج |
| `bun run start` | تشغيل الإنتاج |
| `bun run lint` | فحص الكود |
| `bun run seed` | زرع البيانات |
| `bun run db:push` | تحديث قاعدة البيانات |
| `bun run db:studio` | Prisma Studio |

---

## 📁 بنية المشروع

```
├── prisma/schema.prisma       # قاعدة البيانات
├── public/uploads/            # الملفات المرفوعة
├── scripts/seed.ts            # بيانات تجريبية
└── src/
    ├── app/
    │   ├── page.tsx           # الصفحة الرئيسية
    │   ├── product/[id]/      # تفاصيل المنتج
    │   ├── checkout/[id]/     # الدفع
    │   ├── admin/             # لوحة التحكم
    │   └── api/               # APIs
    ├── components/            # مكونات UI
    └── lib/                   # أدوات مساعدة
```

---

## 🌐 النشر

**Vercel (موصى به):**
1. ارفع المشروع على GitHub
2. اربطه بـ [Vercel](https://vercel.com)
3. أضف متغيرات البيئة
4. انشر! 🚀

---

## 📄 الترخيص

MIT License - Copyright (c) 2026 fartougarso

---

## 👤 المؤلف

**fartougarso** - [GitHub](https://github.com/fartougarso)

---

<div align="center">

**صُمّم بـ ❤️ في الجزائر 🇩🇿**

</div>
