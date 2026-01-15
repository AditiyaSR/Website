# Panduan Deploy Step-by-Step - CV Duta Engineering

Panduan lengkap step-by-step untuk mendeploy website ke production dan submit ke Google.

---

## 📋 DAFTAR ISI

### Bagian 1: Persiapan Final
1.1 Check Content Website
1.2 Update Environment Variables
1.3 Setup Production Database

### Bagian 2: Build Production
2.1 Clean Build Cache
2.2 Production Build
2.3 Test Local Production

### Bagian 3: Setup Repository Git
3.1 Initialize Git Repository
3.2 Push ke GitHub

### Bagian 4: Deploy ke Vercel (Paling Mudah)
4.1 Buat Account Vercel
4.2 Install Vercel CLI
4.3 Login ke Vercel
4.4 Import Project dari GitHub
4.5 Deploy ke Production

### Bagian 5: Setup Domain (Opsional)
5.1 Beli Domain
5.2 Setup DNS
5.3 Verify Domain

### Bagian 6: Google Search Console
6.1 Buat Property
6.2 Verify Ownership
6.3 Submit Sitemap
6.4 Request Indexing

### Bagian 7: Google Analytics
7.1 Buat Property Analytics
7.2 Setup Tracking Code
7.3 Add ke Website
7.4 Verify Tracking

### Bagian 8: Google My Business
8.1 Create Business Profile
8.2 Verify Business
8.3 Optimize Profile

### Bagian 9: Post-Deploy Checklist

---

## 📖 BAGIAN 1: PERSIAPAN FINAL

### STEP 1.1: Check Content Website

**Tujuan**: Pastikan semua konten website sudah final sebelum deploy.

**Ceklist yang harus diperiksa**:

#### a. Homepage Content
- [ ] Judul hero: "Professional Mechanical Seal Solution in Sidoarjo" sudah benar
- [ ] Subhero: "CV Duta Engineering adalah spesialis..." sudah benar
- [ ] Deskripsi: Lengkap dan menarik
- [ ] Badge text: "Mechanical Seal Specialist di Sidoarjo"
- [ ] CTA Button 1: "Request Quotation"
- [ ] CTA Button 2: "Lihat Produk"
- [ ] Statistics: 10+ tahun, 500+ proyek, 50+ klien

**Cara Cek**:
```bash
# 1. Buka browser lokal
# 2. Akses http://localhost:3000
# 3. Scroll setiap section dan cek isi:
#    - Hero section (judul, deskripsi, CTA)
#    - About section (visi, misi)
#    - Products (semua produk sudah benar)
#    - Services (semua layanan terdaftar)
#    - Industries (daftar industri lengkap)
#    - Blog (artikel yang mau dipublish)
#    - Gallery (gambar yang mau ditampilkan)
#    - Contact (email, phone, WhatsApp benar)
```

#### b. About Section Content
- [ ] Title: "Spesialis Mechanical Seal Terpercaya"
- [ ] Vision: "Menjadi pemimpin pasar solusi mechanical seal di Indonesia"
- [ ] Mission: "Memberikan produk dan layanan berkualitas dengan harga kompetitif"
- [ ] Experience text: "10+" sudah benar

#### c. Products Section
- [ ] Mechanical Seal Standard - spesifikasi lengkap
- [ ] Pump Seal - aplikasi industri jelas
- [ ] Cartridge Seal - fitur dan keuntungan
- [ ] Component Seal - komponen yang tersedia
- [ ] Seal Spare Parts - daftar parts lengkap
- [ ] Custom Mechanical Seal - keterangan custom

#### d. Services Section
- [ ] Mechanical Seal Repair - 4 fitur
- [ ] Installation Service - 4 fitur
- [ ] Preventive Maintenance - 4 fitur
- [ ] Seal Overhaul - 4 fitur
- [ ] Troubleshooting - 4 fitur
- [ ] On-site Service - 4 fitur

#### e. Contact Information
- [ ] Address: "Jl. Industri No. XX, Sidoarjo"
- [ ] Phone: "+62 812-3456-7890"
- [ ] Email: "info@dutaengineering.com"
- [ ] WhatsApp: "+62 812-3456-7890"
- [ ] Operating hours benar

**Action Setelah Cek**:
Jika ada yang salah, edit langsung dari website atau gunakan Admin Panel:
```bash
# Akses Admin Panel:
http://localhost:3000/admin/login
# Email: admin@dutaengineering.com
# Password: admin123

# Setelah login, edit section yang perlu:
# - Hero Section: /admin/dashboard/hero
# - About Section: /admin/dashboard/about
# - Services: /admin/dashboard/services
# - Contact: /admin/dashboard/contact
# - Settings: /admin/dashboard/settings
```

---

### STEP 1.2: Update Environment Variables

**Tujuan**: Setup environment variables untuk production.

**Langkah**:

#### a. Buat File .env.production

```bash
# 1. Pastikan di root project (folder /home/z/my-project)
cd /home/z/my-project

# 2. Buat file production environment
cp .env .env.production.example
```

#### b. Edit File .env.production

```bash
# Buka file dengan text editor
nano .env.production

# ATAU gunakan VS Code / text editor favorit
```

**Isi .env.production**:
```env
# ===========================================
# NODE ENVIRONMENT
# ===========================================
NODE_ENV=production

# ===========================================
# DATABASE
# ===========================================
# Untuk Vercel (SQLite di serverless)
DATABASE_URL=file:./db/production.db

# ===========================================
# WEBSITE URL (Ganti dengan domain sebenarnya)
# ===========================================
NEXT_PUBLIC_SITE_URL=https://dutaengineering.com

# ===========================================
# GOOGLE ANALYTICS 4
# ===========================================
# 1. Buka Google Analytics: https://analytics.google.com
# 2. Buat property baru → Click "Web" → "Get started"
# 3. Copy "Measurement ID" (format: G-XXXXXXXXXX)
# 4. Paste di bawah:

NEXT_PUBLIC_GA_MEASUREMENT_ID=G-XXXXXXXXXX

# ===========================================
# GOOGLE TAG MANAGER (Opsional)
# ===========================================
# 1. Buka Google Tag Manager: https://tagmanager.google.com
# 2. Buat account → Buat container
# 3. Copy "GTM Container ID" (format: GTM-XXXXXX)
# 4. Paste di bawah:

NEXT_PUBLIC_GTM_ID=GTM-XXXXXX

# ===========================================
# GOOGLE SEARCH CONSOLE
# ===========================================
# 1. Buka Google Search Console: https://search.google.com/search-console
# 2. Buat property → Pilih verification method
# 3. Copy verification code (format: google1234567890abcdef)
# 4. Paste di bawah:

NEXT_PUBLIC_GOOGLE_VERIFICATION=google1234567890abcdef

# ===========================================
# SOCIAL MEDIA (Opsional)
# ===========================================
NEXT_PUBLIC_FACEBOOK_URL=https://www.facebook.com/dutaengineering
NEXT_PUBLIC_INSTAGRAM_URL=https://www.instagram.com/dutaengineering
NEXT_PUBLIC_LINKEDIN_URL=https://www.linkedin.com/company/duta-engineering

# ===========================================
# CONTACT INFORMATION
# ===========================================
NEXT_PUBLIC_EMAIL=info@dutaengineering.com
NEXT_PUBLIC_PHONE=+6281234567890
NEXT_PUBLIC_WHATSAPP=+6281234567890

# ===========================================
# ADMIN CREDENTIALS (JANG DI-COMMIT KE GIT!)
# ===========================================
# BUKAN hardcode password di file ini
# Gunakan environment variables di server production
```

#### c. Simpan File

```bash
# Simpan dan keluar (untuk nano)
Ctrl + O (simpan)
Ctrl + X (keluar)

# ATAU
# Simpan file
:wq (untuk nano/vim)
```

#### d. Verify Environment Variables

```bash
# Test apakah environment variables sudah benar
echo $NODE_ENV

# Seharus output: production
```

---

### STEP 1.3: Setup Production Database

**Tujuan**: Pastikan database production siap untuk production.

**Langkah**:

#### a. Check Folder Database

```bash
# Pastikan folder db/ ada
ls -la db/

# Output yang diharapkan:
# drwxr-xr-x  2 root root  4096 Jan 15 02:58 .
# -rw-r--r--r--  1 root root  10485760 Jan 15 02:58 custom.db
# drwxr-xr-x  2 root root  4096 Jan 15 02:58 production.db
```

#### b. Backup Database Development

```bash
# 1. Masuk ke folder db
cd db

# 2. Backup database development
cp custom.db backup-development-$(date +%Y%m%d).db

# Output:
# Database development sudah dibackup
```

#### c. Prepare Production Database

```bash
# Production database akan otomatis dibuat saat deploy
# Vercel akan menyiapkan database di serverless
```

---

## 📖 BAGIAN 2: BUILD PRODUCTION

### STEP 2.1: Clean Build Cache

**Tujuan**: Bersihkan build lama untuk memastikan build bersih.

**Langkah**:

```bash
# 1. Pastikan di root project
cd /home/z/my-project

# 2. Hapus folder build lama
rm -rf .next

# Output:
# Folder .next sudah dihapus

# 3. Hapus cache node modules
rm -rf node_modules/.cache

# Output:
# Cache sudah dibersihkan
```

**Kenapa ini penting?**
- Mencegah error dari build lama
- Memastikan semua dependencies terinstall dengan benar
- Mengurangi ukuran build

---

### STEP 2.2: Production Build

**Tujuan**: Build website untuk production.

**Langkah**:

```bash
# 1. Build untuk production
bun run build

# Output yang diharapkan:
# ▲ Next.js 15.3.5
# - Local:        http://localhost:3000
# - Network:      http://21.0.15.128:3000
# - Environments: .env
# 
# ✓ Starting...
# 
# ✓ Linting and checking validity of types
# ✓ Collecting page data
# ✓ Generating static pages (3/3)
# ✓ Finalizing page optimization
# 
# Route (app)                              Size    First Load JS
# ┌ ○ /                                     120 kB    180 kB
# ├ ○ /                                     95 kB    140 kB
# ├ ○ /admin/login                          45 kB    70 kB
# ├ ○ /admin/dashboard                        50 kB    75 kB
# ├ ○ /admin/dashboard/hero                   38 kB    58 kB
# └ ... (lanjutan)
# 
# ○  (Static)                               prerendered as static content
# 
# ✓ Compiled successfully
```

**Waktu yang dibutuhkan**: 2-5 menit (tergantung hardware)

**Apa yang terjadi saat build**:
- TypeScript types dicek
- ESLint rules dijalankan
- Halaman statis di-generate
- Optimasi images dilakukan
- CSS dan JS di-minify

---

### STEP 2.3: Test Local Production Build

**Tujuan**: Test website dalam mode production sebelum deploy.

**Langkah**:

```bash
# 1. Start production build lokal
NODE_ENV=production bun run start

# Output:
# ▲ Next.js 15.3.5
# - Local:        http://localhost:3000
# - Environments: .env.production
# 
# ✓ Ready in 3.2s
```

#### a. Test Website

```bash
# 2. Buka browser
# Google Chrome / Firefox / Safari / Edge

# 3. Akses:
http://localhost:3000
```

#### b. Checklist Testing

**Homepage**:
- [ ] Homepage loading dengan benar
- [ ] Header navigation bekerja
- [ ] Hero section tampil dengan benar
- [ ] Statistics cards muncul
- [ ] Smooth scroll bekerja
- [ ] Mobile responsive (test dengan F12 dev tools)

**Navigation**:
- [ ] Menu desktop bekerja
- [ ] Menu mobile (hamburger) bekerja
- [ ] Scroll ke setiap section smooth
- [ ] Active section highlight bekerja
- [ ] Footer links bekerja

**Content Sections**:
- [ ] About section tampil lengkap
- [ ] Products cards tampil semua
- [ ] Services cards tampil semua
- [ ] Industries cards tampil semua
- [ ] Blog cards tampil semua
- [ ] Gallery cards tampil semua

**Interactivity**:
- [ ] Hover effects pada cards bekerja
- [ ] WhatsApp floating button bekerja
- [ ] Scroll to top button muncul saat scroll
- [ ] Contact form bisa di-submit
- [ ] Admin panel bisa diakses

**Performance**:
- [ ] Loading cepat (< 2 detik)
- [ ] Tidak ada console errors
- [ ] Tidak ada 404 pages
- [ ] Gambar semua loading

#### c. Fix Issues jika Ada

**Problem**: Tampilan tidak sesuai
```
Solusi:
1. Cek content di Admin Panel
2. Edit dan simpan ulang
3. Refresh browser (Ctrl + F5)
```

**Problem**: Broken links
```bash
Solusi:
1. Cek semua link di source code
2. Pastikan path benar (relative atau absolute)
3. Test setiap link dengan klik
```

**Problem**: Responsif issue
```bash
Solusi:
1. Test di berbagai ukuran browser (1920x1080, 1366x768, 375px wide)
2. Buka DevTools (F12) → Toggle device toolbar
3. Cek mobile, tablet, desktop
```

#### d. Stop Production Server

```bash
# Setelah testing selesai, stop server
Ctrl + C
# ATAU
# Tutup terminal/browser
```

---

## 📖 BAGIAN 3: SETUP REPOSITORY GIT

### STEP 3.1: Initialize Git Repository

**Tujuan**: Setup Git untuk version control dan deploy ke Vercel.

**Langkah**:

```bash
# 1. Pastikan di root project
cd /home/z/my-project

# 2. Cek apakah sudah ada .git folder
ls -la .git 2>/dev/null

# Jika sudah ada:
# Already initialized

# Jika belum ada, lanjut ke langkah 3
```

#### a. Initialize Git (jika belum ada)

```bash
# 1. Initialize Git repository
git init

# Output:
# Initialized empty Git repository in /home/z/my-project/.git/
```

#### b. Buat .gitignore File

```bash
# Buat atau edit .gitignore
nano .gitignore
```

**Isi .gitignore**:
```gitignore
# Dependencies
node_modules/
.pnp
.yarn/

# Build outputs
.next/
out/
build/
dist/

# Environment files
.env.local
.env.development
.env.production (JANG DI-COMMIT PASSWORD!)

# Database
db/*.db
db/*.db-shm
db/*.db-wal

# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
Thumbs.db

# Logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*
```

#### c. Simpan .gitignore

```bash
# Simpan
Ctrl + O
Ctrl + X
```

---

### STEP 3.2: Push ke GitHub

**Tujuan**: Upload code ke GitHub untuk deploy otomatis.

#### a. Buat Repository di GitHub

**Langkah**:

1. Buka https://github.com/new
2. Login dengan GitHub account
3. Klik "New repository"

**Isi Repository**:
```
Repository name: duta-engineering-website
Description: Website CV Duta Engineering - Mechanical Seal Specialist in Sidoarjo
Public: ✅ (Centang)
Add a README file: ✅ (Centang)
Add .gitignore: ✅ (Centang)
Choose: .gitignore template
License: MIT

Klik "Create repository"
```

**Repository URL yang dihasilkan**:
```
https://github.com/username/duta-engineering-website
```

#### b. Connect Local Repository ke GitHub

```bash
# 1. Tambahkan remote origin
git remote add origin https://github.com/username/duta-engineering-website.git

# 2. Cek remote
git remote -v

# Output:
# origin  https://github.com/username/duta-engineering-website.git (fetch)
```

#### c. Staging Changes

```bash
# 1. Check status files
git status

# Output:
# On branch master
# Your branch is up to date with 'origin/master'.
#
# Changes to be committed:
#   modified:   .env.production
#   new file:   deploy.sh
#
# no changes added to commit (use "git add <file>..." to include in what will be committed)
```

#### d. Stage Semua Files

```bash
# Add semua file
git add .

# Atau stage file spesifik:
git add src/
git add public/
git add package.json
git add tsconfig.json
git add tailwind.config.ts
git add .env.production
git add deploy.sh
git add README.md
git add .gitignore
```

**File-file penting yang harus di-commit**:
- src/ (source code)
- public/ (assets: logo, robots.txt)
- package.json (dependencies)
- tsconfig.json (TypeScript config)
- tailwind.config.ts (styling config)
- .gitignore (file ignore rules)
- deploy.sh (deployment script)

**JANG COMMIT**:
- node_modules/ (otomatis di-ignore)
- .next/ (build output, otomatis di-ignore)
- db/*.db (database, otomatis di-ignore)
- .env.local (local env, otomatis di-ignore)

#### e. Commit Changes

```bash
# Buat commit dengan pesan yang jelas
git commit -m "Initial commit - CV Duta Engineering website with Admin Panel

Changes:
- Modern website with glassmorphism effects
- Complete Admin Panel for content management
- SEO optimization with sitemap and structured data
- Google Analytics 4 integration ready
- Responsive design for all devices"

# Output:
# [master (root-commit)] abc1234567890 10 files changed, 2000 insertions(+)
#
#  abc1234567890 files changed, 2000 insertions(+)
# create mode 100644 .env.production
# create mode 100755 DEPLOYMENT_GUIDE.md
# create mode 100755 CHECKLIST.md
# create mode 100755 deploy.sh
# create mode 100644 src/app/admin/login/page.tsx
# ... (lanjutan)
```

#### f. Push ke GitHub

```bash
# Push ke remote
git push -u origin master

# Output:
# Enumerating objects: 1500, done.
# Counting objects: 100% (1500/1500), done.
# Delta compression using up to 8 threads
# Compressing objects: 100% (1000/1000), done.
# Writing objects: 100% (2000/2000), done.
# Total 2000 (delta 1000), reused 0 (delta 1000), pack-reused 0
# To https://github.com/username/duta-engineering-website.git
#    abc1234567890..def1234567890  master -> master
#    abc1234567890..def1234567890  master -> master
```

**Proses ini akan memakan waktu**: 1-5 menit (tergantung internet speed)

#### g. Verify di GitHub

```bash
# 1. Buka repository di browser
# https://github.com/username/duta-engineering-website

# 2. Pastikan semua files sudah terupload
#    - src/ folder
#    - public/ folder
#    - configuration files
#    - documentation files

# 3. Cek commit history
# Klik "commits" tab di GitHub
# Pastikan commit message tampil:
# "Initial commit - CV Duta Engineering website with Admin Panel"
```

---

## 📖 BAGIAN 4: DEPLOY KE VERCEL

### STEP 4.1: Buat Account Vercel

**Tujuan**: Setup account Vercel untuk deployment.

#### a. Sign Up Vercel

**Langkah**:

1. Buka https://vercel.com/signup
2. Sign up dengan pilihan:

**Opsi 1: GitHub** (Rekomendasi)
- Klik "Continue with GitHub"
- Authorize Vercel dengan GitHub account
- Semua GitHub repositories otomatis terimport

**Opsi 2: Email**
- Masukkan email
- Masukkan password
- Masukkan nama lengkap
- Klik "Sign Up"

**Opsi 3: Google, GitLab, Bitbucket**
- Klik "Continue with [provider]"
- Authorize Vercel dengan [provider] account

#### b. Complete Profile

Setelah signup:

1. Upload profile photo (opsional)
2. Add username (opsional)
3. Confirm email (klik link di email)
4. Dashboard Vercel sudah siap digunakan

---

### STEP 4.2: Install Vercel CLI

**Tujuan**: Install Vercel CLI untuk deployment command line.

**Langkah**:

```bash
# 1. Install Vercel CLI global
bun install -g vercel

# Output:
# + vercel@39.0.3
# added 1 package in 0.1s

# 2. Verify instalasi
vercel --version

# Output:
# Vercel CLI 39.0.3
# @vercel/scarfaced 2022.01.01T00:00:00.000Z
```

**Kenapa CLI lebih baik?**
- Command line lebih cepat
- Dapat di-otomasi (scripts)
- Deployment lebih stabil
- Bisa di-integrasikan dengan CI/CD

---

### STEP 4.3: Login ke Vercel

**Tujuan**: Connect CLI dengan Vercel account.

**Langkah**:

```bash
# 1. Login ke Vercel CLI
vercel login

# Output browser akan terbuka:
# 1. Vercel akan terbuka di browser
# 2. Pilih "Continue" untuk authentication
# 3. Klik avatar → Log in with [provider]
# 4. Authorize akses
```

#### a. Set Default Project (Opsional)

```bash
# Set default project jika punya banyak
vercel link

# Output:
# ? Set up and deploy "~/my-project"? [Y/n] Y
# ? Which scope do you want to deploy to? Username/duta-engineering
# ? What's your project's name? duta-engineering-website
```

---

### STEP 4.4: Deploy ke Production

**Tujuan**: Upload dan deploy website ke production.

#### a. Deploy dari GitHub (Method 1 - Rekomendasi)

**Langkah**:

```bash
# 1. Deploy ke Vercel production
vercel --prod

# Output yang akan muncul:
# Vercel CLI 39.0.3
# 
# NOTE: A project called "duta-engineering-website" already exists in this workspace.
# 
# ? Set up and deploy "~/my-project"? [Y/n] Y
# ? Which scope do you want to deploy to? Username/duta-engineering
# ? What's your project's name? duta-engineering-website
# ? In which directory is your code located? ./
# ? Want to override the settings? [y/N] n
# 
# Building...
# Packaging...
# Uploading...
# Deploying...
# 
# ┌────────────────────────────────────────────────────────────┐
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# └────────────────────────────────────────────────────────────┘
# 
# Building...
# Packaging...
# Uploading...
# Deploying...
# 
# ┌────────────────────────────────────────────────────────────┐
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# │  https://duta-engineering-website.vercel.app        │
# └────────────────────────────────────────────────────────────┘
# 
# Building...
# Packaging...
# Uploading...
# Deploying...
# 
# > Success! Deployed to Vercel
# 
# > Deployment URL: https://duta-engineering-website.vercel.app
# > Project URL: https://vercel.com/username/duta-engineering-website
# > Build logs: https://vercel.com/username/duta-engineering-website/_logs
```

**Waktu deploy**: 2-5 menit

#### b. Import Project dari Vercel Dashboard (Method 2)

**Langkah**:

1. Buka Vercel Dashboard: https://vercel.com/dashboard
2. Klik "Add New Project"
3. Klik "Import Git Repository"
4. Pilih "GitHub"
5. Pilih repository: "duta-engineering-website"
6. Klik "Import"

Vercel akan otomatis:
- Import repository
- Run build
- Deploy ke production

---

### STEP 4.5: Verify Deployment

**Tujuan**: Pastikan deployment sukses.

**Langkah**:

```bash
# 1. Buka deployment URL
https://duta-engineering-website.vercel.app

# 2. Test semua fitur:
#    - Homepage loading
#    - Navigation smooth scroll
#    - All sections accessible
#    - Contact form bekerja
#    - Admin panel accessible
```

**Ceklist yang harus dicek**:

- [ ] Homepage tampil dengan benar
- [ ] Header navigation bekerja
- [ ] Smooth scroll ke section
- [ ] Products section tampil
- [ ] Services section tampil
- [ ] Industries section tampil
- [ ] Blog section tampil
- [ ] Gallery section tampil
- [ ] Contact section tampil
- [ ] Footer links bekerja
- [ ] Mobile responsive (test di HP)
- [ ] Tidak ada console errors (buka DevTools → Console)
- [ ] WhatsApp floating button bekerja
- [ ] Scroll to top button muncul saat scroll

---

## 📖 BAGIAN 5: SETUP DOMAIN (OPSIONAL)

### STEP 5.1: Beli Domain

**Tujuan**: Memilih dan membeli domain untuk website.

#### a. Rekomendasi Domain

**Domain .com (Rekomendasi)**:
- dutaengineering.com
- mechanical-seal-sidoarjo.com
- dutaseal.com

**Domain .id (Opsi lokal)**:
- dutaengineering.id
- cvduta.id

**Rekomendasi Provider**:
- Niagahoster: https://www.niagahoster.co.id (lokal, support bagus)
- IDCloudHost: https://idcloudhost.com (lokal, terpercaya)
- Domainesia: https://www.domainesia.com (lokal, banyak pilihan)
- RumahWeb: https://www.rumahweb.com (lokal, murah)

**Tips Memilih Domain**:
1. Mudah diingat dan dieja
2. Pendek (2-3 suku kata)
3. Hindari angka dan simbol (kecuali tanda hubung)
4. Hindari typo umum (ganda j, h, ganti k)
5. Cek ketersediaan domain yang diinginkan

#### b. Beli Domain

**Contoh proses beli di Niagahoster**:

1. Buka: https://www.niagahoster.co.id/cart
2. Cek ketersediaan domain
3. Pilih domain yang diinginkan
4. Pilih durasi (1 tahun rekomendasi)
5. Masukkan data registrasi:
   - Nama lengkap
   - Alamat email
   - No. telepon
   - Alamat lengkap (sesuai KTP)
6. Pilih metode pembayaran (Transfer Bank, OVO, dll)
7. Klik "Lanjut Pembayaran"
8. Selesaikan pembayaran
9. Lakun konfirmasi domain akan dikirim ke email

**Data yang perlu diisi**:
```
Domain: dutaengineering.com
Duration: 1 tahun
Nameserver 1: ns1.niagahoster.net
Nameserver 2: ns2.niagahoster.net
```

---

### STEP 5.2: Setup DNS

**Tujuan**: Mengarahkan domain ke website yang sudah di-deploy.

#### a. Setup Domain di Vercel

**Langkah**:

1. Buka Vercel Dashboard
2. Pilih project: "duta-engineering-website"
3. Klik "Settings" → "Domains"
4. Klik "Add Domain"

5. Pilih "I already own a domain"
6. Masukkan domain: dutaengineering.com
7. Klik "Add"

**Vercel akan memberikan instruksi DNS**:
```
To configure dutaengineering.com for use with Vercel, update your domain's DNS settings with the following records:

Record   | Name  | Type   | Value              | TTL
---------|-------|--------|--------------------|-----
A Record | @      | A      | 76.76.21.21      | 3600
CNAME     | www   | CNAME  | cname.vercel-dns.com | 3600

You may also need to update your nameservers.

If your DNS provider does not support ALIAS records at the zone apex, use the following instead:

Record   | Name  | Type   | Value              | TTL
---------|-------|--------|--------------------|-----
A Record | @      | A      | 76.76.21.21      | 3600
CNAME     | www   | CNAME  | cname.vercel-dns.com | 3600
```

#### b. Setup DNS di Domain Provider

**Contoh: Niagahoster**

1. Login ke panel Niagahoster
2. Cari menu "DNS Management" atau "Manage DNS"
3. Klik "Add Record" atau "Tambah DNS"

**Tambahkan Record A (Root)**:
```
Type: A
Host/Name: @ (untuk root domain) atau kosong
Value: 76.76.21.21
TTL: 3600 (atau biarkan default)
Klik: Save / Simpan
```

**Tambahkan Record CNAME (WWW)**:
```
Type: CNAME
Host/Name: www
Value: cname.vercel-dns.com
TTL: 3600 (atau biarkan default)
Klik: Save / Simpan
```

#### c. Verify DNS Propagation

```bash
# Cek apakah DNS sudah propagate

# Linux/Mac:
dig dutaengineering.com A

# Windows:
nslookup dutaengineering.com

# Online tools:
# https://www.whatsmydns.net/
# https://dnschecker.org/
```

**Output yang diharapkan**:
```
; <<>> DiG 9.10.3.5 <<>> ns1.niagahoster.net
dutaengineering.com.        IN    A     76.76.21.21
dutaengineering.com.        3599  IN    A     76.76.21.21
```

**Waktu propagation**: 5 menit - 48 jam (biasanya 15-30 menit)

---

### STEP 5.3: Verify Domain

**Tujuan**: Pastikan domain sudah berhasil diarahkan.

#### a. Check HTTPS Certificate

```bash
# 1. Buka browser
# 2. Akses: https://dutaengineering.com

# 3. Cek address bar:
# Seharus ada lock icon (🔒)
# Seharus "Not Secure" atau "Your connection is not private"

# 4. Klik lock icon untuk melihat certificate
# Issued to: *.vercel-dns.com
# Issued by: Let's Encrypt (otomatis dari Vercel)
# Valid from: [tanggal deploy] to [tanggal expire]
```

#### b. Test Website dengan Domain

```bash
# 1. Test di berbagai browser:
#    - Google Chrome
#    - Firefox
#    - Safari
#    - Microsoft Edge

# 2. Test dengan dan tanpa www:
#    - https://dutaengineering.com
#    - https://www.dutaengineering.com

# 3. Test mobile:
#    - Buka di HP
#    - Check responsive design
#    - Test navigation mobile
```

#### c. Check Redirect (jika ada)

```bash
# Test redirect dari www ke non-www
curl -I https://www.dutaengineering.com

# Output seharus:
# HTTP/2 301 301
# location: https://dutaengineering.com/
```

---

## 📖 BAGIAN 6: GOOGLE SEARCH CONSOLE

### STEP 6.1: Buat Property

**Tujuan**: Daftarkan website di Google Search Console.

**Langkah**:

1. Buka: https://search.google.com/search-console
2. Login dengan Google account
3. Klik "Add Property"

#### a. Pilih Verification Method

**Method 1: Domain Property (Rekomendasi)**
```
1. Pilih "URL prefix"
2. Masukkan: https://dutaengineering.com
3. Klik "Continue"

Google akan otomatis:
1. Verify ownership melalui DNS
2. Setup property

Keuntungan:
- Otomatis verify
- Tidak perlu tambahkan file
- Lebih cepat
```

**Method 2: HTML File Upload**
```
1. Pilih "HTML tag"
2. Klik "Browse"
3. Upload file: public/google1234567890abcdef.html
4. Klik "Verify"

Keuntungan:
- Lebih kontrol
- File tersimpan di server
```

**Method 3: DNS TXT Record**
```
1. Pilih "DNS TXT record"
2. Google akan memberikan verification code
3. Add DNS TXT record di domain provider:
   Name: @
   Value: google-site-verification=google1234567890abcdef
   TTL: 3600
4. Klik "Verify"

Keuntungan:
- Bagus untuk custom domain
- Tidak perlu upload file
```

---

### STEP 6.2: Verify Ownership

**Tujuan**: Pastikan Google mengakui kepemilikan website.

**Setelah Verification**:

```bash
# Google akan menampilkan:
"✅ Ownership verified"
```

**Jika gagal**:

**Problem 1**: Verification code salah
```bash
Solusi:
1. Copy ulang verification code dari Google
2. Paste ulang di DNS atau HTML file
3. Tunggu 5-10 menit
4. Klik "Verify" lagi
```

**Problem 2**: DNS belum propagate
```bash
Solusi:
1. Tunggu lebih lama (30-60 menit)
2. Check dengan dig/nameslookup
3. Refresh halaman Google Search Console
```

**Problem 3**: HTML file tidak accessible
```bash
Solusi:
1. Pastikan file di public/ folder
2. Cek file di: https://dutaengineering.com/google1234567890abcdef.html
3. Pastikan content benar:
   <meta name="google-site-verification" content="google1234567890abcdef" />
```

---

### STEP 6.3: Submit Sitemap

**Tujuan**: Beritahu Google struktur website.

**Langkah**:

1. Buka: https://search.google.com/search-console/sitemaps
2. Pilih property: "CV Duta Engineering (dutaengineering.com)"
3. Klik "Add a new sitemap"

4. Masukkan sitemap URL:
```
https://dutaengineering.com/sitemap.xml
```

5. Klik "Submit"

**Yang terjadi**:
- Google akan crawl sitemap
- Semua URL akan di-index
- Status akan muncul "Success" dalam beberapa jam

---

### STEP 6.4: Request Indexing

**Tujuan**: Meminta Google untuk meng-index website.

**Langkah**:

1. Buka: https://search.google.com/search-console/url-inspection
2. Masukkan URL: https://dutaengineering.com
3. Klik "Request Indexing"

**Status yang akan muncul**:
- **Pending**: URL dalam antrian untuk di-index
- **Processing**: Sedang di-index
- **Success**: URL berhasil di-index
- **Excluded**: URL dikecualikan (cek alasan)

**Tips untuk indexing cepat**:
- Quality content (sudah dicek)
- Mobile-friendly (sudah diimplementasi)
- Fast loading (Vercel CDN)
- Secure HTTPS (sudah aktif)
- Internal links (sudah ada)
- Sitemap submitted (sudah dilakukan)

---

## 📖 BAGIAN 7: GOOGLE ANALYTICS 4

### STEP 7.1: Buat Property Analytics

**Tujuan**: Setup tracking untuk analytics.

**Langkah**:

1. Buka: https://analytics.google.com
2. Klik "Start measuring"
3. Pilih account: "Create account"

#### a. Setup Account

**Isi Form**:
```
Account name: CV Duta Engineering

1. Choose platform: Web

2. Configure account data:
   - Website URL: https://dutaengineering.com
   - Industry category: Technology > Industrial
   - Business size: Small (1-10 employees)
   - Time zone: (GMT+07:00) Asia/Jakarta
   - Currency: Indonesian Rupiah (IDR)

3. Check agreement boxes
   - Google Analytics Terms of Service Agreement
   - Data Processing Amendment

4. Klik "Create"
```

#### b. Accept Terms

```bash
Google akan menampilkan:
"Google Analytics for Firebase"
"Accept Terms"

Klik "Accept" untuk lanjut.
```

---

### STEP 7.2: Setup Tracking Code

**Tujuan**: Mengambil Measurement ID untuk website.

#### a. Get Measurement ID

Setelah create property:

1. Cek di dashboard
2. Klik "Gear icon" → "Data Streams"
3. Cek "Measurement ID"

**Format Measurement ID**: `G-XXXXXXXXXX`

**Copy measurement ID ini!**

---

### STEP 7.3: Add ke Website

**Tujuan**: Integrasikan tracking ke website.

#### a. Update Environment Variable

```bash
# 1. Edit .env.production
nano .env.production

# 2. Paste measurement ID
NEXT_PUBLIC_GA_MEASUREMENT_ID=G-XXXXXXXXXX

# 3. Simpan
Ctrl + O
Ctrl + X
```

#### b. Redeploy ke Vercel

```bash
# 1. Push perubahan ke GitHub
git add .env.production
git commit -m "Add Google Analytics Measurement ID"
git push

# 2. Vercel otomatis redeploy
# Atau deploy manual:
vercel --prod
```

#### c. Verify Integration

Setelah redeploy:

1. Buka: https://dutaengineering.com
2. Buka DevTools (F12)
3. Cek Network tab
4. Cek request ke:

Cari request ke:
```
https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX
```

Status harus:
- **Status Code**: 200 (Success)
- **Response**: JavaScript dari Google Analytics

---

### STEP 7.4: Verify Tracking

**Tujuan**: Pastikan analytics berfungsi.

**Langkah**:

1. Buka: https://analytics.google.com
2. Pilih property: "CV Duta Engineering"
3. Klik "Realtime"

**Apa yang harus dilihat**:
```
Right now (30 min)
- Users: 1 (anda)
- Events: 0 (belum ada event)
- Pageviews: 1 (homepage sudah di-load)
```

**Tips untuk testing tracking**:

```bash
# 1. Buka beberapa tab browser
#    - Tab 1: Homepage (tidak apa-apa)
#    - Tab 2: About section
#    - Tab 3: Products section

# 2. Scroll di setiap tab
# 3. Cek Realtime user count
# Seharus bertambah setiap kali page view baru
```

**Test Events**:

```bash
# 1. Submit contact form di website
# 2. Buka Google Analytics → Realtime
# 3. Klik "Events"
# 4. Seharus muncul event:
#    - form_submission
#    - contact_form_submit
#    - atau event lain yang dikirim
```

---

## 📖 BAGIAN 8: GOOGLE MY BUSINESS

### STEP 8.1: Create Business Profile

**Tujuan**: Daftarkan bisnis di Google Maps dan Local Search.

**Langkah**:

1. Buka: https://business.google.com
2. Klik "Manage now"

#### a. Add Business Name

**Isi Form**:
```
Business name: CV Duta Engineering

Category: 
- Industrial Pump Supplier
- Engineering Consultant

Business information:
- Name: CV Duta Engineering
- Address: Jl. Industri No. XX, Sidoarjo, Jawa Timur
- City: Sidoarjo
- State/Province: Jawa Timur
- ZIP Code: 612XX
- Country: Indonesia
- Phone: +62 812-3456-7890
- Website: https://dutaengineering.com

Klik "Next" (atau "Lanjut")
```

#### b. Add Services

**Pilih category lalu tambahkan**:

**Mechanical Seal Sales**:
```
- Service name: Mechanical Seal Sales
- Service type: Shop / Retail outlet

Klik "Add" untuk setiap service:
1. Mechanical Seal Sales
2. Seal Repair Service
3. Pump Installation
4. Engineering Support
```

**Hours Operation**:
```
Monday - Friday:
- Open: 08:00
- Close: 17:00

Saturday:
- Open: 08:00
- Close: 13:00

Sunday:
- Closed

Klik "Next"
```

#### c. Finish

**Ceklist yang harus dipastikan**:
```
- [ ] Business name sudah diisi
- [ ] Address lengkap
- [ ] Phone number sudah diisi
- [ ] Website URL sudah diisi
- [ ] Primary category dipilih
- [ ] Services minimal 1 sudah ditambah
- [ ] Operating hours sudah diisi
- [ ] Payment method: Di tempat (tidak online)
- [ ] Business location: Customer visits
```

Klik "Finish" untuk selesai.

---

### STEP 8.2: Verify Business

**Tujuan**: Verifikasi kepemilikan bisnis.

#### a. Choose Verification Method

**Method 1: Postcard (Rekomendasi)**
```
1. Klik "Verify now"
2. Pilih "Mail"
3. Confirm address: Jl. Industri No. XX, Sidoarjo
4. Klik "Send postcard"

Google akan mengirim postcard berisi verification code ke alamat.

Waktu kirim: 5-7 hari kerja

5. Setelah terima postcard:
   - Buka email dari Google
   - Copy verification code (5 digit)
   - Klik "Verify" di Google My Business dashboard
   - Masukkan code
```

**Method 2: Phone Verification**
```
1. Klik "Verify now"
2. Pilih "Phone"
3. Masukkan phone number: +62 812-3456-7890
4. Klik "Get code"

5. Google akan call ke nomor tersebut
6. Masukkan kode yang diterima lewat SMS/telepon
```

**Method 3: Video Verification**
```
1. Klik "Verify now"
2. Pilih "Video"
3. Google akan berikan instruksi:
   - Rekam video diri dengan tanda di kertas
   - Tunjukkan: nama bisnis di kertas
   - Tunjukkan alamat perusahaan
   - Upload video

Waktu review: 1-3 hari kerja
```

---

### STEP 8.3: Optimize Profile

**Tujuan**: Optimize profile untuk tampilan maksimal.

#### a. Add Business Photos

**Upload foto-foto ini**:

1. Logo CV Duta Engineering
   - Format: JPG atau PNG
   - Resolusi: Min 720x720px
   - Ukuran: < 1MB

2. Workshop photos
   - Foto area kerja maintenance seal
   - Foto alat dan peralatan
   - Foto tim bekerja

3. Product photos
   - Foto mechanical seal
   - Foto pompa dan komponen
   - Foto packaging produk

4. Team photos
   - Foto founder/owner
   - Foto tim teknisi
   - Foto pelatihan

5. Exterior photos
   - Foto depan kantor/gudang
   - Foto signboard perusahaan
   - Foto sekitar area

**Tips untuk foto berkualitas**:
- Pencahayaan bagus
- Kualitas tinggi (tidak blur)
- Resolution minimal 720x720px
- Komposisi menarik
- Latar bersih

#### b. Add Business Description

```bash
Edit business description:

"CV Duta Engineering adalah spesialis Mechanical Seal dan Industrial Sealing Solution terpercaya di Sidoarjo, Jawa Timur. Melayani penjualan, repair, dan maintenance mechanical seal untuk berbagai industri seperti manufaktur, food & beverage, chemical, petrochemical, water treatment, power plant, pulp & paper, dan mining.

Kami menyediakan berbagai jenis mechanical seal standar dan custom dengan material berkualitas tinggi. Tim teknisi berpengalaman kami siap membantu Anda dengan solusi sealing yang efektif dan tahan lama.

Layanan kami meliputi:
- Penjualan mechanical seal dan komponen
- Jasa repair dan overhaul seal
- Instalasi dan commissioning
- Program preventive maintenance
- Konsultasi teknis dan troubleshooting
- On-site service area Jawa Timur

Hubungi kami untuk konsultasi gratis!"
```

#### c. Set Business Attributes

```bash
Klik "Info" untuk set attributes:

Business attributes:
- Women-owned: Tidak (atau sesua)
- Veteran-owned: Tidak (atau sesua)
- Black-owned: Tidak (atau sesuai)
- LGBTQ+ owned: Tidak (atau sesuai)
```

---

### STEP 8.4: Verify Listing

**Tujuan**: Pastikan bisnis muncul di Google Search & Maps.

#### a. Check Google Search

```bash
# 1. Buka Google
# 2. Search: "CV Duta Engineering mechanical seal Sidoarjo"

# Seharus muncul di hasil:
# ┌──────────────────────────────────────────────────┐
# │ CV Duta Engineering                       │
# │ Industrial Pump Supplier                    │
# │ ⭐ 4.8 (Google review)             │
# │ Jl. Industri No. XX, Sidoarjo, Jawa Timur│
# │ +62 812-3456-7890                   │
# │ https://dutaengineering.com              │
# │ Mon-Sat, 10AM-6PM                       │
# └──────────────────────────────────────────────────┘
```

#### b. Check Google Maps

```bash
# 1. Buka Google Maps
# 2. Search: "CV Duta Engineering Sidoarjo"

# Seharus muncul:
- Marker di lokasi yang benar
- Business info card
- Reviews (jika ada)
- Photos yang di-upload
```

---

## 📖 BAGIAN 9: POST-DEPLOY CHECKLIST

### STEP 9.1: Final Verification Checklist

**Ceklist lengkap setelah deploy**:

#### a. Technical Requirements
```
☑️ Build production berhasil (tanpa errors)
☑️ Website accessible di production URL
☑️ HTTPS certificate valid (lock icon di browser)
☑️ DNS propagation selesai
☑️ Domain resolves correctly (dengan dan tanpa www)
☑️ No 404 errors untuk halaman utama
☑️ Admin panel accessible
☑️ Environment variables production sudah diset
```

#### b. Content & Functionality
```
☑️ Homepage tampil dengan benar
☑️ Hero section (judul, deskripsi, CTA) benar
☑️ About section (visi, misi) lengkap
☑️ Products section (semua 6 produk) tampil
☑️ Services section (semua 6 layanan) tampil
☑️ Industries section (8 industri) tampil
☑️ Blog section (4 artikel) tampil
☑️ Gallery section (8 galeri) tampil
☑️ Contact section (info lengkap) tampil
☑️ Smooth scroll navigation bekerja
☑️ Mobile responsive (test di HP)
☑️ Contact form bisa di-submit
☑️ WhatsApp button bekerja
☑️ Scroll to top button bekerja
☑️ Footer links semua bekerja
```

#### c. SEO & Google Integration
```
☑️ Title tags optimized untuk semua halaman
☑️ Meta descriptions lengkap dan unik
☑️ Keywords relevant (mechanical seal, Sidoarjo, dll)
☑️ Open Graph images (1200x630px)
☑️ Twitter Card setup
☑️ Robots.txt di-upload
☑️ Sitemap.xml dibuat
☑️ Structured data (JSON-LD) diimplementasi
☑️ Google Analytics 4 measurement ID diset
☑️ Google Search Console property dibuat
☑️ Ownership verified di Google Search Console
☑️ Sitemap submitted ke Google
☑️ Website indexed di Google (search "CV Duta Engineering")
☑️ Google My Business listing aktif
☑️ Business verified
☑️ Rich snippets visible di SERP
```

#### d. Performance
```
☑️ Core Web Vitals passing:
   - LCP (Largest Contentful Paint): < 2.5s
   - FID (First Input Delay): < 100ms
   - CLS (Cumulative Layout Shift): < 0.1
☑️ PageSpeed Insights score > 90 (mobile & desktop)
☑️ Mobile performance score > 90
☑️ Desktop performance score > 90
☑️ Website loading < 3 detik
☑️ No console errors
☑️ Tidak ada broken links
```

#### e. Business Requirements
```
☑️ Contact form berfungsi (test form submission)
☑️ Phone calls bisa dilakukan
☑️ WhatsApp integration bekerja
☑️ Email delivery working (cek inbox)
☑️ Admin panel accessible
☑️ Password admin sudah diganti dari default
☑️ Database production terbackup
```

---

## 🎉 CHECKLIST SUCCESS

Jika semua item di atas sudah dicek dengan ☑️:

**SELAMAT!** Website CV Duta Engineering sudah berhasil di-deploy dan terintegrasi dengan Google!

**Next Steps**:
1. Monitor Google Analytics weekly
2. Update content secara berkala
3. Check Google Search Console untuk errors
4. Update Google My Business dengan foto dan posts
5. Check backlinks secara berkala
6. Perform regular maintenance
7. Update produk dan layanan
8. Respond to contact inquiries

---

## 📞 SUPPORT & TROUBLESHOOTING

### Masalah yang Mungkin Terjadi

#### 1. Build Errors

**Problem**: Build gagal
```bash
Solusi:
1. Clear build cache: rm -rf .next
2. Reinstall dependencies: bun install
3. Check TypeScript errors: bun run lint
4. Check syntax errors di code
```

#### 2. Deploy Gagal

**Problem**: Vercel deploy gagal
```bash
Solusi:
1. Check Vercel logs: vercel logs duta-engineering-website
2. Rebuild: vercel --prod --force
3. Check GitHub connection
4. Check environment variables di Vercel dashboard
```

#### 3. Domain Tidak Bekerja

**Problem**: Domain tidak mengarah ke website
```bash
Solusi:
1. Check DNS records di domain provider
2. Check domain status di Vercel dashboard
3. Wait untuk DNS propagation (5-60 menit)
4. Check dengan: dig dutaengineering.com
```

#### 4. Google Tidak Index

**Problem**: Website tidak muncul di Google Search
```bash
Solusi:
1. Check robots.txt (pastikan "Disallow: /" tidak ada)
2. Request manual indexing di Google Search Console
3. Check canonical URL
4. Tunggu 1-3 hari untuk indexing
5. Check coverage report di Google Search Console
```

#### 5. Analytics Tidak Tracking

**Problem**: Google Analytics tidak mencatat data
```bash
Solusi:
1. Verify measurement ID sudah benar
2. Check NEXT_PUBLIC_GA_MEASUREMENT_ID environment variable
3. Redeploy untuk apply environment variable baru
4. Check browser console untuk errors
5. Test tracking dengan membuka website di beberapa tab
```

---

## 📞 LINK PENTING

Dokumentasi tambahan:
- Vercel Deploy: https://vercel.com/docs
- Google Search Console: https://support.google.com/webmasters/
- Google Analytics: https://support.google.com/analytics/
- Google My Business: https://support.google.com/business/
- Next.js Documentation: https://nextjs.org/docs

---

**Versi**: 1.0
**Untuk**: CV Duta Engineering
**Tanggal**: 15 Januari 2025
