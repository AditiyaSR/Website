# Deploy Website CV Duta Engineering - Quick Reference

Ringkasan cepat langkah deploy website ke production dan Google.

---

## 🚀 DEPLOY CEPAT (3 LANGKAH)

### Langkah 1: Deploy ke Vercel (Recommended)

```bash
# Install Vercel CLI
bun install -g vercel

# Deploy ke production
vercel --prod

# Website akan live di: https://duta-engineering-website.vercel.app
```

---

### Langkah 2: Setup Domain

1. **Beli domain** (rekomendasi: dutaengineering.com)
2. **Buka Vercel Dashboard**: https://vercel.com/dashboard
3. **Add Domain**: Settings → Domains → Add Domain
4. **Setup DNS** sesuai instruksi Vercel
5. **Tunggu 5-60 menit** untuk DNS propagation

---

### Langkah 3: Submit ke Google

#### a. Google Search Console (wajib)

```bash
# 1. Buka Google Search Console
https://search.google.com/search-console

# 2. Add Property
# → Klik "Add Property"
# → Pilih "URL prefix"
# → Masukkan: https://dutaengineering.com

# 3. Verify Ownership
# → Pilih method: HTML file upload
# → Upload: public/google1234567890abcdef.html (belum ada, buat dulu)

# 4. Submit Sitemap
# → Buka: https://search.google.com/search-console/sitemaps
# → Pilih property: CV Duta Engineering
# → Masukkan: https://dutaengineering.com/sitemap.xml
# → Klik "Submit"
```

#### b. Google Analytics (wajib)

```bash
# 1. Buka Google Analytics
https://analytics.google.com

# 2. Create Property
# → Klik "Start measuring"
# → Platform: Web
# → Property name: CV Duta Engineering
# → Website URL: https://dutaengineering.com
# → Industry: Technology > Industrial
# → Business size: Small
# → Time zone: Asia/Jakarta
# → Klik "Create"

# 3. Get Measurement ID
# → Copy measurement ID: G-XXXXXXXXXX

# 4. Update Environment Variable
# Edit: .env.production
# Tambah: NEXT_PUBLIC_GA_MEASUREMENT_ID=G-XXXXXXXXXX

# 5. Redeploy
vercel --prod

# 6. Verify Tracking
# → Buka: https://dutaengineering.com
# → Buka Google Analytics → Realtime
# → Pastikan: "Right now (30 min)" = 1
```

#### c. Google My Business (opsional tapi rekomendasi)

```bash
# 1. Buka Google My Business
https://business.google.com

# 2. Create Listing
# → Business name: CV Duta Engineering
# → Category: Industrial Pump Supplier
# → Address: Jl. Industri No. XX, Sidoarjo
# → Phone: +62 812-3456-7890
# → Website: https://dutaengineering.com

# 3. Verify Business
# → Pilih method: Postcard / Phone / Video
# → Follow instruksi Google

# 4. Add Products & Services
# → Mechanical Seal, Pump Seal, dll
# → Services: Repair, Maintenance, Installation
```

---

## 📋 CHECKLIST DEPLOY

### Sebelum Deploy
- [ ] Semua konten final (Hero, About, Products, dll)
- [ ] Environment variables production siap
- [ ] Build production sukses (tanpa errors)
- [ ] GitHub repository sudah dibuat
- [ ] README.md lengkap

### Setelah Deploy Vercel
- [ ] Deployment URL aktif (https://duta-engineering-website.vercel.app)
- [ ] SSL certificate valid (HTTPS working)
- [ ] Website bisa diakses
- [ ] Tidak ada 404 errors
- [ ] Semua halaman loading

### Setelah Setup Domain
- [ ] DNS propagation selesai
- [ ] Domain resolves ke website
- [ ] www dan non-www sama-sama bekerja
- [ ] HTTPS active

### Setelah Google Integration
- [ ] Google Search Console property dibuat
- [ ] Ownership verified
- [ ] Sitemap submitted
- [ ] Website mulai di-index
- [ ] Google Analytics 4 property dibuat
- [ ] Measurement ID diintegrasikan
- [ ] Tracking bekerja (cek Realtime)
- [ ] Google My Business profile dibuat
- [ ] Business verified

### Testing Akhir
- [ ] Homepage tampil dengan benar
- [ ] Navigation smooth scroll bekerja
- [ ] Mobile responsive (test di HP)
- [ ] Contact form bisa di-submit
- [ ] Admin panel accessible
- [ ] SEO tags muncul di source code

---

## ⏱ ESTIMASI WAKTU

| Tugas | Estimasi Waktu |
|-------|---------------|
| Build production | 2-5 menit |
| Deploy ke Vercel | 5-10 menit |
| DNS propagation | 5-60 menit |
| Google verification | 5-10 menit |
| Sitemap indexing | 1-3 hari |
| Total: 1-2 jam pertama |

---

## 🔗 LINK PENTING

### Production Website
- **URL**: https://dutaengineering.com (dengan domain)
- **Vercel (sbelum domain)**: https://duta-engineering-website.vercel.app
- **Admin Panel**: https://dutaengineering.com/admin/login
- **Login**: admin@dutaengineering.com
- **Password**: admin123 (GANTI SETELAH LOGIN PERTAMA!)

### Google Services
- **Search Console**: https://search.google.com/search-console
- **Analytics**: https://analytics.google.com
- **My Business**: https://business.google.com
- **Tag Manager**: https://tagmanager.google.com (opsional)

### Documentation
- **Deploy Guide**: DEPLOY_STEP_BY_STEP.md (detail)
- **Deployment Guide**: DEPLOYMENT_GUIDE.md (lengkap)
- **Admin Guide**: ADMIN_PANEL_GUIDE.md

---

## ⚠️ PENTING!

### Password Admin
- **Default**: admin123
- **WAJIB**: Ganti password setelah login pertama!
- **Cara ganti**: Edit di Admin Panel → Settings

### Backup Database
- **Location**: db/production.db (setelah deploy)
- **Frequency**: Backup mingguan atau bulanan
- **Command**: `cp db/production.db db/backup-$(date +%Y%m%d).db`

### Environment Variables
- **JANG** hardcode password di commit!
- **JANG** kirim .env.production ke GitHub
- **Pastikan** semua secrets hanya ada di environment production

---

## 🎯 CHECKLIST SELESAI

Deploy berhasil jika:

✅ Website live di https://dutaengineering.com
✅ HTTPS aktif dan valid
✅ Google Search Console terintegrasi
✅ Google Analytics 4 tracking aktif
✅ Google My Business listing aktif (opsional)
✅ Sitemap submitted ke Google
✅ Website mulai di-index oleh Google
✅ Contact form dapat diakses
✅ Admin panel berfungsi
✅ Mobile responsive teruji
✅ Core Web Vitals passing

---

## 📞 BANTUAN

Jika butuh bantuan:

1. **Deploy Issues**: Baca DEPLOYMENT_GUIDE.md section 13 (Troubleshooting)
2. **Google Issues**: Lihat panduan di Google Search Console/Analytics
3. **Vercel Support**: https://vercel.com/support
4. **Documentation**: Next.js docs → https://nextjs.org/docs

---

**Dibuat**: 15 Januari 2025
**Untuk**: CV Duta Engineering
