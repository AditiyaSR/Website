# Admin Panel - CV Duta Engineering

Sistem admin website CV Duta Engineering untuk memudahkan pengeditan konten tanpa coding.

## 🚀 Fitur Utama

### 1. **Login Admin**
- URL: `/admin/login`
- Email: `admin@dutaengineering.com`
- Password: `admin123`
- **⚠️ Ubah password setelah login pertama!**

### 2. **Dashboard Overview**
- Statistik konten (produk, layanan, blog, galeri)
- Quick actions untuk tambah konten
- Recent activity log
- Quick links ke editor

### 3. **Content Editor**
Sistem editor memudahkan mengubah:

#### a. Hero Section (`/admin/dashboard/hero`)
- Judul utama
- Subtitle
- Deskripsi lengkap
- Badge text
- CTA button text (2 tombol)
- Live preview

#### b. About Section (`/admin/dashboard/about`)
- Title dan description
- Vision statement
- Mission statement
- Experience text
- Layout preview

#### c. Products (`/admin/dashboard/products`)
- Tambah, edit, hapus produk
- Setiap produk:
  - Nama produk
  - Kategori
  - Deskripsi
  - Spesifikasi (JSON)
  - Icon name
  - Gradient color
  - Status active/inactive
  - Urutan tampilan

#### d. Services (`/admin/dashboard/services`)
- Tambah, edit, hapus layanan
- Setiap layanan:
  - Title
  - Description
  - Features list (JSON)
  - Icon name
  - Gradient color
  - Status active/inactive
  - Urutan tampilan

#### e. Industries (`/admin/dashboard/industries`)
- Tambah, edit, hapus industri
- Setiap industri:
  - Nama industri
  - Description
  - Icon name
  - Gradient color
  - Status active/inactive
  - Urutan tampilan

#### f. Blog Articles (`/admin/dashboard/blog`)
- Tambah, edit, hapus artikel
- Setiap artikel:
  - Title
  - Excerpt
  - Category
  - Date
  - Read time
  - Gradient
  - Full content (Markdown)
  - Status published/unpublished
  - Urutan tampilan

#### g. Gallery (`/admin/dashboard/gallery`)
- Tambah, edit, hapus galeri
- Setiap item:
  - Title
  - Category
  - Gradient
  - Image URL
  - Status active/inactive
  - Urutan tampilan

#### h. Contact Info (`/admin/dashboard/contact`)
- Edit informasi kontak:
  - Address
  - Phone numbers
  - Email
  - WhatsApp
  - Operating hours
  - Google Maps URL

#### i. Site Settings (`/admin/dashboard/settings`)
- General settings:
  - Company name
  - Tagline
  - SEO Title
  - SEO Description
  - Contact details
  - Social media links

## 📁 Struktur Database

### Models yang Tersedia:

1. **User**
   - Admin authentication
   - Role management (admin, editor)

2. **HeroSection**
   - Hero content management

3. **AboutSection**
   - About page content

4. **Stat**
   - Statistics data

5. **Product**
   - Product catalog

6. **Service**
   - Services list

7. **Industry**
   - Industries served

8. **BlogArticle**
   - Blog posts

9. **GalleryItem**
   - Gallery images

10. **ContactInfo**
    - Contact information

11. **SiteSettings**
    - Global settings

## 🔐 Keamanan

### Authentication
- Token-based session
- HttpOnly cookies
- Secure cookies in production
- 24-hour session expiration

### Password
- Hashed dengan bcrypt
- Minimum password length enforcement (rekomendasi 8 karakter)
- Password change functionality (akan ditambahkan)

## 📝 Cara Penggunaan

### 1. Login ke Admin Panel

```bash
# Akses URL
http://localhost:3000/admin/login

# Gunakan kredensial default:
Email: admin@dutaengineering.com
Password: admin123
```

### 2. Edit Konten

#### Hero Section:
1. Buka `/admin/dashboard/hero`
2. Edit form sesuai kebutuhan
3. Lihat preview di kartu bawah
4. Klik "Simpan"
5. Perubahan langsung tampil di website

#### Products:
1. Buka `/admin/dashboard/products`
2. Klik "Tambah Produk"
3. Isi form:
   - Nama: "Mechanical Seal Standard"
   - Kategori: "Mechanical Seal"
   - Deskripsi: Deskripsi produk
   - Spesifikasi: JSON array
     ```json
     ["Material: Carbon/SiC/TC", "Ukuran: 1/2\" - 6\"", "Aplikasi: Air, Oil, Chemical"]
     ```
   - Icon: "Settings"
   - Gradient: "from-blue-500/20 to-cyan-500/20"
4. Simpan

### 3. API Endpoints (Untuk Integrasi)

#### GET/POST `/api/admin/hero`
- GET: Mendapatkan hero content
- POST: Update hero content

#### GET/POST `/api/admin/products`
- GET: Mendapatkan list produk
- POST: Tambah produk baru

#### GET/PUT/DELETE `/api/admin/products/[id]`
- GET: Detail produk
- PUT: Update produk
- DELETE: Hapus produk

#### Similar untuk:
- `/api/admin/services`
- `/api/admin/industries`
- `/api/admin/blog`
- `/api/admin/gallery`
- `/api/admin/contact`
- `/api/admin/settings`

## 🎨 Tips Menggunakan Editor

### 1. Hero Section
- **Judul Utama**: Gunakan kalimat yang kuat dan menarik
  ✅ Baik: "Professional Mechanical Seal Solution in Sidoarjo"
  ❌ Buruk: "Kami menjual mechanical seal"

- **Badge**: Label singkat yang menarik perhatian
  ✅ "Mechanical Seal Specialist di Sidoarjo"
  ✅ "10+ Tahun Pengalaman"

- **CTA Buttons**:
  - Button 1: Action utama (Request Quotation)
  - Button 2: Secondary action (Lihat Produk)

### 2. Products & Services
- Gunakan gradient color yang berbeda untuk kategori
- Icon name dari Lucide React icons
- Spesifikasi dalam format JSON array

### 3. Blog Articles
- **Excerpt**: Ringkasan 2-3 kalimat
- **Category**: Panduan Teknis, Maintenance, Troubleshooting, Studi Kasus
- **Date**: Format "15 Januari 2025"
- **Read Time**: "5 menit baca"

### 4. Gallery
- Upload gambar ke folder `public/gallery/`
- Masukkan URL: `/gallery/nama-file.jpg`
- Kategori: Workshop, On-site, Facility, Service, QC, Project, Education, Delivery

## 🔧 Pengaturan Lanjutan

### Menambahkan API Endpoints Baru

Contoh untuk produk:

```typescript
// src/app/api/admin/products/route.ts
import { NextRequest, NextResponse } from 'next/server'
import { db } from '@/lib/db'

export async function GET(request: NextRequest) {
  const products = await db.product.findMany({
    where: { isActive: true },
    orderBy: { order: 'asc' }
  })

  return NextResponse.json({ products })
}

export async function POST(request: NextRequest) {
  const body = await request.json()

  const product = await db.product.create({
    data: {
      ...body,
      order: await db.product.count(),
    }
  })

  return NextResponse.json({ product }, { status: 201 })
}
```

### Update Main Page untuk Fetch dari Database

```typescript
// src/app/page.tsx
export default async function Home() {
  const [hero, products, services, about] = await Promise.all([
    db.heroSection.findFirst({ where: { isActive: true } }),
    db.product.findMany({ where: { isActive: true }, orderBy: { order: 'asc' } }),
    db.service.findMany({ where: { isActive: true }, orderBy: { order: 'asc' } }),
    db.aboutSection.findFirst(),
  ])

  return (
    <div>
      {/* Gunakan data dari database */}
      <HeroSection content={hero} />
      <ProductsSection products={products} />
      <ServicesSection services={services} />
      <AboutSection content={about} />
    </div>
  )
}
```

## 📊 Flow Kerja Admin

1. **Login** → Masuk ke `/admin/login`
2. **Dashboard** → Lihat overview di `/admin/dashboard`
3. **Pilih Menu** → Klik section yang mau diedit
4. **Edit Konten** → Ubah form sesuai kebutuhan
5. **Preview** → Lihat preview live di kartu bawah
6. **Simpan** → Klik tombol simpan
7. **Verifikasi** → Buka website utama untuk cek hasil

## 🎯 Best Practices

### 1. Konten
- ✅ Gunakan bahasa Indonesia yang jelas
- ✅ Hindari typo dan grammar salah
- ✅ Konsisten dengan tone profesional
- ✅ Relevan dengan B2B audience

### 2. SEO
- ✅ Title mengandung keyword utama
- ✅ Description relevan dan menarik
- ✅ Gunakan kata kunci: "mechanical seal", "Sidoarjo", "Jawa Timur"

### 3. Gambar
- ✅ Format: JPG atau PNG
- ✅ Resolusi optimal: 800x600 ke atas
- ✅ File size: < 500KB per gambar
- ✅ Nama file deskriptif (bukan 123.jpg)

### 4. Spesifikasi Produk
- ✅ Format JSON yang valid
- ✅ Detail dan akurat
- ✅ Satuan yang jelas (inch, mm, dll)
- ✅ Material yang benar

## 🚨 Troubleshooting

### Login Gagal
**Problem**: Tidak bisa login

**Solution**:
1. Cek email dan password
2. Clear cookies browser
3. Reset admin user (jalankan `bun run seed-admin.ts` lagi)

### Perubahan Tidak Tampil
**Problem**: Setelah simpan, website tidak berubah

**Solution**:
1. Refresh halaman website
2. Clear cache browser (Ctrl+F5)
3. Cek console untuk error

### Database Error
**Problem**: "Database connection error"

**Solution**:
1. Cek file `.env` ada `DATABASE_URL`
2. Pastikan folder `db/` ada
3. Jalankan `bun run db:push`

## 📞 Support & Maintenance

### Update Password
Untuk mengubah password admin, jalankan:

```bash
# Edit script dan ganti password di hash
# Atau buat API endpoint untuk change password
```

### Backup Data
Backup database di folder `db/`:

```bash
# Copy database
cp db/custom.db db/backup-$(date +%Y%m%d).db
```

### Reset Admin
Untuk reset ke kondisi awal:

```bash
# Hapus database
rm db/custom.db

# Push schema lagi
bun run db:push

# Seed admin user lagi
bun run seed-admin.ts
```

## 📚 Referensi

### Icons Available
Icons dari Lucide React. Beberapa contoh:
- Settings, Package, Wrench, Factory, FileText, Image (as ImageIcon)
- Phone, Mail, MapPin, MessageCircle
- Award, Users, Clock, ShieldCheck
- CheckCircle2, TrendingUp, ArrowRight

### Gradient Colors
Format Tailwind CSS:
- `from-blue-500/20 to-cyan-500/20`
- `from-purple-500/20 to-pink-500/20`
- `from-orange-500/20 to-yellow-500/20`
- `from-green-500/20 to-emerald-500/20`
- `from-indigo-500/20 to-blue-500/20`
- `from-red-500/20 to-orange-500/20`
- `from-amber-500/20 to-yellow-500/20`

## 🎓 Langkah Selanjutnya

Untuk pengembangan lebih lanjut:

1. **API Routes Lengkap**: Buat semua API endpoints untuk CRUD
2. **Update Main Page**: Hubungkan main page dengan database
3. **Image Upload**: Tambah fitur upload gambar langsung dari admin
4. **Password Change**: Buat halaman ganti password
5. **Activity Log**: Log semua aktivitas admin
6. **Export/Import**: Fitur export dan import data
7. **Version Control**: Simpan history perubahan konten
8. **Multi-language**: Dukungan bahasa Indonesia dan English

---

**Dibuat oleh**: Z.ai Code
**Versi**: 1.0.0
**Tanggal**: 15 Januari 2025
