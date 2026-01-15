# Panduan Lengkap: Publish Website CV Duta Engineering

Panduan lengkap untuk deploy website ke production dan submit ke Google.

---

## 📋 Table of Contents

1. [Persiapan Sebelum Deploy](#1-persiapan-sebelum-deploy)
2. [Build Website untuk Production](#2-build-website-untuk-production)
3. [Pilih Platform Hosting](#3-pilih-platform-hosting)
4. [Deploy ke Vercel (Rekomendasi)](#4-deploy-ke-vercel)
5. [Deploy ke Netlify (Opsi Gratis)](#5-deploy-ke-netlify)
6. [Deploy ke Server Sendiri](#6-deploy-ke-server-sendiri)
7. [Setup Domain](#7-setup-domain)
8. [Google Search Console](#8-google-search-console)
9. [Google Analytics](#9-google-analytics)
10. [Google My Business](#10-google-my-business)
11. [Optimasi SEO](#11-optimasi-seo)
12. [Performance Checklist](#12-performance-checklist)
13. [Troubleshooting](#13-troubleshooting)

---

## 1. Persiapan Sebelum Deploy

### 1.1 Update Semua Konten

```bash
# Pastikan semua konten sudah final:
✅ Hero section - judul, subtitle, deskripsi
✅ About section - visi, misi
✅ Products - list lengkap
✅ Services - semua layanan
✅ Industries - daftar industri
✅ Blog - artikel yang mau dipublish
✅ Gallery - gambar yang mau ditampilkan
✅ Contact - email, phone, WhatsApp benar
✅ Site settings - nama perusahaan, SEO, dll
```

### 1.2 Update Environment Variables

Buat file `.env.production`:

```env
# Production Environment Variables
NODE_ENV=production
DATABASE_URL=file:./db/production.db

# API Keys (jika ada)
NEXT_PUBLIC_GA_MEASUREMENT_ID=G-XXXXXXXXXX
NEXT_PUBLIC_GOOGLE_VERIFICATION=google-site-verification-token
```

### 1.3 Optimasi Gambar

```bash
# Pastikan gambar sudah teroptimasi:
✅ Format: WebP (preferred) atau JPEG
✅ Resolution: Max 1920x1080 untuk hero images
✅ File size: < 500KB per gambar
✅ Compress: Gunakan tool seperti TinyPNG atau Squoosh

# Lokasi gambar yang benar:
public/logo.png - Logo CV Duta Engineering
public/products/ - Gambar produk
public/gallery/ - Gambar galeri
```

### 1.4 SEO Metadata Check

Pastikan metadata di `src/app/layout.tsx` sudah benar:

```typescript
export const metadata: Metadata = {
  title: "CV Duta Engineering - Professional Mechanical Seal Solution in Sidoarjo",
  description: "CV Duta Engineering adalah spesialis Mechanical Seal dan Industrial Sealing Solution terpercaya di Sidoarjo, Jawa Timur. Melayani penjualan, repair, dan maintenance seal untuk berbagai industri.",
  keywords: [
    "mechanical seal",
    "industrial sealing solution",
    "CV Duta Engineering",
    "mechanical seal Sidoarjo",
    "seal repair",
    "pump seal",
    "industrial seal",
    "seal maintenance",
    "seal supplier Jawa Timur",
    "jasa seal pompa",
    "repair seal industri"
  ],
  authors: [{ name: "CV Duta Engineering" }],
  openGraph: {
    title: "CV Duta Engineering - Professional Mechanical Seal Solution in Sidoarjo",
    description: "Spesialis Mechanical Seal dan Industrial Sealing Solution di Sidoarjo, Jawa Timur.",
    url: "https://dutaengineering.com",
    siteName: "CV Duta Engineering",
    type: "website",
    locale: "id_ID",
    images: [
      {
        url: "/logo.png",
        width: 1200,
        height: 630,
        alt: "CV Duta Engineering Logo",
      },
    ],
  },
  twitter: {
    card: "summary_large_image",
    title: "CV Duta Engineering - Mechanical Seal Specialist",
    description: "Professional Mechanical Seal Solution in Sidoarjo, Jawa Timur",
    images: ["/logo.png"],
  },
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      "max-video-preview": -1,
      "max-image-preview": "large",
      "max-snippet": -1,
    },
  },
  metadataBase: new URL("https://dutaengineering.com"),
}
```

---

## 2. Build Website untuk Production

### 2.1 Clean Build

```bash
# Bersihkan build lama
rm -rf .next
rm -rf node_modules/.cache
```

### 2.2 Production Build

```bash
# Build untuk production
bun run build
```

Output yang diharapkan:

```
✓ Compiled successfully
✓ Linting and checking validity of types
✓ Collecting page data
✓ Generating static pages (3/3)
✓ Finalizing page optimization

Route (app)                              Size    First Load JS
┌ ○ /                                     XX kB            XX kB
├ ○ /admin/login                            XX kB            XX kB
├ ○ /admin/dashboard                        XX kB            XX kB
├ ○ /admin/dashboard/hero                   XX kB            XX kB
└ ...

○  (Static)                               prerendered as static content
```

### 2.3 Test Production Build

```bash
# Test build lokal
bun run start

# Buka http://localhost:3000
# Pastikan semua fitur berjalan dengan benar
```

---

## 3. Pilih Platform Hosting

### Opsi Hosting Tersedia:

| Platform | Harga | SSL Gratis | Custom Domain | Rekomendasi |
|----------|--------|------------|---------------|--------------|
| **Vercel** | Gratis + Pro | ✅ | ✅ | ⭐⭐⭐⭐⭐ |
| **Netlify** | Gratis + Pro | ✅ | ✅ | ⭐⭐⭐⭐ |
| **VPS (DigitalOcean)** | $5/bln | ❌ (setup manual) | ✅ | ⭐⭐⭐ |
| **Cloudflare Pages** | Gratis | ✅ | ✅ | ⭐⭐⭐⭐ |
| **GitHub Pages** | Gratis | ✅ | ✅ (subdomain) | ⭐⭐⭐ |
| **Railway** | Gratis + Pro | ✅ | ✅ | ⭐⭐⭐⭐ |

### Rekomendasi: Vercel

**Kenapa Vercel?**
- ✅ Deployment otomatis dari Git
- ✅ Gratis SSL certificate
- ✅ Global CDN (super cepat)
- ✅ Zero configuration
- ✅ Preview deployments
- ✅ Analytics built-in
- ✅ Perfect untuk Next.js

---

## 4. Deploy ke Vercel (Rekomendasi)

### 4.1 Persiapan Repository

```bash
# 1. Initialize Git repository
git init
git add .
git commit -m "Initial commit - CV Duta Engineering website"

# 2. Push ke GitHub/GitLab/Bitbucket
git remote add origin https://github.com/username/duta-engineering-website.git
git push -u origin main
```

### 4.2 Deploy dengan Vercel CLI

#### a. Install Vercel CLI

```bash
# Install Vercel CLI global
bun install -g vercel
```

#### b. Login ke Vercel

```bash
# Login ke Vercel
vercel login

# Follow instruksi di browser:
# 1. Buka URL yang muncul
# 2. Login dengan GitHub/Google/Email
# 3. Authorize access
```

#### c. Deploy Production

```bash
# Deploy ke production
vercel --prod

# Jawab pertanyaan:
# ? Set up and deploy "~/my-project"? [Y/n] Y
# ? Which scope do you want to deploy to? [Pilih atau buat baru]
# ? Link to existing project? [N/y] N (pertama kali)
# ? What's your project's name? duta-engineering-website
# ? In which directory is your code located? ./
# ? Want to override the settings? [y/N] y

# Tunggu proses deploy...
```

#### d. Deploy Result

```
✅ Preview: https://duta-engineering-website.vercel.app
✅ Production: https://duta-engineering-website.vercel.app

> Success! Deployed to Vercel
> Deployment complete

   Deployment URL: https://duta-engineering-website.vercel.app
   Project URL: https://vercel.com/username/duta-engineering-website
```

### 4.3 Update Production Settings

#### a. Environment Variables di Vercel

1. Buka: https://vercel.com/username/duta-engineering-website/settings/environment-variables
2. Tambah variables:

| Name | Value | Environment |
|------|--------|--------------|
| NODE_ENV | production | Production, Preview, Development |
| DATABASE_URL | file:./db/production.db | Production |

3. Klik "Save"

#### b. Custom Domain

1. Buka: https://vercel.com/username/duta-engineering-website/settings/domains
2. Klik "Add Domain"
3. Masukkan domain: `dutaengineering.com`
4. Follow instruksi DNS configuration:

```
Type: A Record
Name: @
Value: 76.76.21.21
TTL: 3600
```

### 4.4 Continuous Deployment

Setiap push ke GitHub akan otomatis deploy:

```bash
# Buat perubahan
git add .
git commit -m "Update hero section"
git push

# Vercel otomatis deploy!
# Cek di dashboard Vercel
```

---

## 5. Deploy ke Netlify (Opsi Gratis)

### 5.1 Install Netlify CLI

```bash
# Install Netlify CLI
bun install -g netlify-cli
```

### 5.2 Login ke Netlify

```bash
# Login
netlify login

# Browser akan terbuka untuk authentication
```

### 5.3 Deploy Production

```bash
# Build untuk production
bun run build

# Deploy ke Netlify
netlify deploy --prod --dir=.next/standalone
```

### 5.4 Netlify Dashboard

1. Buka: https://app.netlify.com/
2. Pilih "Add new site"
3. Drag & drop folder `.next/standalone`
4. Deploy otomatis!

---

## 6. Deploy ke Server Sendiri

### 6.1 Build untuk Production

```bash
# Production build
bun run build
```

### 6.2 Setup Server (VPS/VPS)

#### a. Connect ke Server

```bash
# SSH ke server
ssh user@your-server-ip

# Update system
sudo apt update && sudo apt upgrade -y
```

#### b. Install Node.js & Bun

```bash
# Install Bun
curl -fsSL https://bun.sh/install | bash

# Atau install Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
```

#### c. Install PM2 (Process Manager)

```bash
# Install PM2 globally
npm install -g pm2

# Atau pakai bun
npm install -g pm2
```

#### d. Upload Project

```bash
# Opsi 1: Git clone (rekomendasi)
cd /var/www
git clone https://github.com/username/duta-engineering-website.git
cd duta-engineering-website

# Opsi 2: SCP/SFTP upload
scp -r .next user@your-server:/var/www/duta-engineering-website/
```

#### e. Start Server

```bash
# Install dependencies
bun install

# Build (jika belum)
bun run build

# Start dengan PM2
pm2 start bun --name "duta-engineering" -- start "bun run start"

# Save PM2 configuration
pm2 save
```

#### f. Setup Nginx Reverse Proxy

```nginx
# /etc/nginx/sites-available/dutaengineering.com
server {
    listen 80;
    server_name dutaengineering.com www.dutaengineering.com;

    root /var/www/duta-engineering-website/.next/standalone;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }

    location /_next/static {
        alias /var/www/duta-engineering-website/.next/static/;
        expires max;
        add_header Cache-Control "public, max-age=31536000, immutable";
    }

    location /_next/image {
        alias /var/www/duta-engineering-website/.next/image/;
        expires max;
        add_header Cache-Control "public, max-age=31536000, immutable";
    }
}
```

```bash
# Enable site
sudo ln -s /etc/nginx/sites-available/dutaengineering.com /etc/nginx/sites-enabled/

# Test configuration
sudo nginx -t

# Restart Nginx
sudo systemctl restart nginx
```

---

## 7. Setup Domain

### 7.1 Beli Domain

Beli domain dari:
- **Niagahoster**: https://www.niagahoster.co.id
- **IDCloudHost**: https://idcloudhost.com
- **Domainesia**: https://www.domainesia.com
- **Gandi**: https://gandi.net
- **Namecheap**: https://namecheap.com

**Rekomendasi**: `.com` atau `.id` (indonesia)

### 7.2 Configure DNS Settings

#### a. Untuk Vercel

1. Login ke provider domain
2. Cari menu "DNS Management" atau "Manage DNS"
3. Add DNS records sesuai instruksi Vercel:

```
Type: A
Name: @
Value: 76.76.21.21 (sesuai Vercel)
TTL: 3600

Type: CNAME
Name: www
Value: cname.vercel-dns.com
TTL: 3600
```

#### b. Untuk Server Sendiri

```
Type: A
Name: @
Value: YOUR_SERVER_IP
TTL: 3600

Type: A
Name: www
Value: YOUR_SERVER_IP
TTL: 3600
```

### 7.3 Propagation Time

Tunggu DNS propagation (biasanya 5 min - 48 jam):

```bash
# Check DNS propagation
nslookup dutaengineering.com

# Atau pakai tool online:
# https://www.whatsmydns.net/
```

### 7.4 HTTPS/SSL Setup

#### a. Vercel (Automatic)

✅ SSL certificate otomatis dari Vercel (Let's Encrypt)

#### b. Server Sendiri dengan Certbot

```bash
# Install Certbot
sudo apt install -y certbot python3-certbot-nginx

# Generate SSL certificate
sudo certbot --nginx -d dutaengineering.com -d www.dutaengineering.com

# Restart Nginx
sudo systemctl restart nginx
```

---

## 8. Google Search Console

### 8.1 Buat Google Search Console Account

1. Buka: https://search.google.com/search-console
2. Login dengan Google account
3. Pilih "Add Property"

### 8.2 Tambah Website

#### Option 1: Domain Property

```
1. Pilih "URL prefix"
2. Masukkan: https://dutaengineering.com
3. Klik "Continue"
```

#### Option 2: Domain Property

```
1. Pilih "Domain"
2. Masukkan: dutaengineering.com
3. Klik "Continue"
```

### 8.3 Verify Website Ownership

#### Method 1: HTML File (Rekomendasi)

```bash
# 1. Buat file verification di public/
touch public/google1234567890abcdef.html

# 2. Edit file dengan verification code
echo "google-site-verification: google1234567890abcdef" > public/google1234567890abcdef.html
```

Deploy ulang untuk meng-upload file ini.

#### Method 2: DNS TXT Record

```
1. Copy verification code dari Google
2. Add DNS TXT record:
   Name: @
   Value: google-site-verification=google1234567890abcdef
   TTL: 3600
3. Wait DNS propagation
4. Klik "Verify"
```

#### Method 3: Google Tag Manager

```
1. Buat Google Tag Manager account
2. Copy GTM container ID (GTM-XXXXXX)
3. Add ke layout.tsx:
   <Script id="google-tag-manager" src={`https://www.googletagmanager.com/gtm.js?id=GTM-XXXXXX`} />
```

### 8.4 Submit Sitemap

#### a. Buat Sitemap (jika belum ada)

Buat file: `src/app/sitemap.ts`

```typescript
import { MetadataRoute } from 'next'

export default function sitemap(): MetadataRoute.Sitemap {
  return [
    {
      url: 'https://dutaengineering.com',
      lastModified: new Date(),
      changeFrequency: 'daily',
      priority: 1,
    },
    {
      url: 'https://dutaengineering.com/#about',
      lastModified: new Date(),
      changeFrequency: 'weekly',
      priority: 0.9,
    },
    {
      url: 'https://dutaengineering.com/#products',
      lastModified: new Date(),
      changeFrequency: 'weekly',
      priority: 0.9,
    },
    {
      url: 'https://dutaengineering.com/#services',
      lastModified: new Date(),
      changeFrequency: 'weekly',
      priority: 0.9,
    },
    {
      url: 'https://dutaengineering.com/#contact',
      lastModified: new Date(),
      changeFrequency: 'monthly',
      priority: 0.8,
    },
  ]
}
```

#### b. Submit Sitemap ke Google

1. Buka: https://search.google.com/search-console/sitemaps
2. Pilih property: CV Duta Engineering
3. Klik "Add a new sitemap"
4. Masukkan: `https://dutaengineering.com/sitemap.xml`
5. Klik "Submit"

### 8.5 Request Indexing

Manual request untuk index website:

```
1. Buka: https://search.google.com/search-console/url-inspection

2. Masukkan URL:
   https://dutaengineering.com

3. Klik "Request Indexing"

4. Status akan muncul:
   - Success: URL terindex
   - Excluded: URL dikecualikan (cek alasan)
   - Pending: Masih dalam antrian
```

---

## 9. Google Analytics 4

### 9.1 Buat Google Analytics 4 Property

1. Buka: https://analytics.google.com
2. Klik "Start measuring"
3. Pilih "Web"
4. Account: Create account atau pilih existing

### 9.2 Setup Property

```
1. Property name: CV Duta Engineering
2. Website URL: https://dutaengineering.com
3. Industry category: Technology > Industrial
4. Business size: Small (1-10 employees)
5. Time zone: (GMT+07:00) Asia/Jakarta
6. Klik "Create"
```

### 9.3 Get Measurement ID

Setelah create, Google akan memberikan:
```
Measurement ID: G-XXXXXXXXXX
Stream Name: Web Stream
```

### 9.4 Integrate Google Analytics ke Next.js

#### a. Install GA4 Library

```bash
bun install @next/third-parties/google
```

#### b. Create Google Analytics Component

Buat file: `src/components/google-analytics.tsx`

```typescript
'use client'

import { GoogleAnalytics } from '@next/third-parties/google'

export default function GoogleAnalytics({ measurementId }: { measurementId: string }) {
  return (
    <>
      <GoogleAnalytics gaId={measurementId} />
    </>
  )
}
```

#### c. Add to Layout

Edit `src/app/layout.tsx`:

```typescript
import GoogleAnalytics from '@/components/google-analytics'
import Script from 'next/script'

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="id">
      <body>
        {children}

        {/* Google Analytics */}
        <GoogleAnalytics measurementId={process.env.NEXT_PUBLIC_GA_MEASUREMENT_ID} />

        {/* Google Tag Manager (opsional) */}
        <Script
          id="google-tag-manager"
          src={`https://www.googletagmanager.com/gtm.js?id=${process.env.NEXT_PUBLIC_GTM_ID}`}
        />
      </body>
    </html>
  )
}
```

#### d. Update Environment Variables

`.env.production`:
```env
NEXT_PUBLIC_GA_MEASUREMENT_ID=G-XXXXXXXXXX
NEXT_PUBLIC_GTM_ID=GTM-XXXXXX
```

### 9.5 Verify Tracking

```bash
# Deploy ulang
bun run build
vercel --prod

# Buka website
# Buka Google Analytics > Realtime
# Pastikan ada active users
```

---

## 10. Google My Business

### 10.1 Buat Google Business Profile

1. Buka: https://business.google.com/
2. Login dengan Google account
3. Klik "Manage now"

### 10.2 Create Business Listing

#### a. Business Information

```
Business name: CV Duta Engineering
Category: Industrial Pump Supplier / Engineering Consultant
Address: Jl. Industri No. XX, Sidoarjo, Jawa Timur
City: Sidoarjo
State/Province: Jawa Timur
ZIP Code: 612XX
Country: Indonesia
Phone: +62 812-3456-7890
Website: https://dutaengineering.com
```

#### b. Verify Business

Choose verification method:

**Method 1: Postcard**

```
1. Klik "Mail"
2. Confirm address
3. Tunggu 5-7 hari kerja
4. Masukkan verification code
```

**Method 2: Phone**

```
1. Klik "Phone"
2. Masukkan phone number: +62 812-3456-7890
3. Klik "Get code"
4. Tunggu call dari Google (otomatis)
5. Masukkan code yang diberikan
```

**Method 3: Video**

```
1. Record video signboard
2. Upload ke Google Business
3. Tunggu review (1-3 hari kerja)
```

### 10.3 Optimize Business Profile

#### a. Add Business Information

```
Business hours:
- Monday - Friday: 08:00 - 17:00
- Saturday: 08:00 - 13:00
- Sunday: Closed

Services:
- Mechanical Seal Sales
- Seal Repair & Maintenance
- Installation Services
- Engineering Support

Photos:
- Logo CV Duta Engineering
- Workshop photos
- Product photos
- Team photos
```

#### b. Add Products/Services

```
1. Klik "Products" di dashboard
2. Add "Mechanical Seal" products:
   - Mechanical Seal Standard
   - Pump Seal
   - Cartridge Seal
   - Component Seal
   - Custom Mechanical Seal

3. Add services:
   - Mechanical Seal Repair
   - Installation Service
   - Preventive Maintenance
   - Seal Overhaul
   - Troubleshooting
   - On-site Service
```

---

## 11. Optimasi SEO

### 11.1 Meta Tags Optimization

Pastikan semua halaman punya meta tags lengkap:

#### Homepage

```typescript
// src/app/page.tsx
export const metadata = {
  title: "CV Duta Engineering - Professional Mechanical Seal Solution in Sidoarjo",
  description: "CV Duta Engineering adalah spesialis Mechanical Seal dan Industrial Sealing Solution terpercaya di Sidoarjo, Jawa Timur. Melayani penjualan, repair, dan maintenance seal untuk berbagai industri.",
  keywords: [
    "mechanical seal",
    "industrial sealing solution",
    "CV Duta Engineering",
    "mechanical seal Sidoarjo",
    "seal repair",
    "pump seal",
    "industrial seal",
    "seal maintenance",
    "seal supplier Jawa Timur"
  ],
  openGraph: {
    title: "CV Duta Engineering - Professional Mechanical Seal Solution",
    description: "Spesialis Mechanical Seal dan Industrial Sealing Solution di Sidoarjo, Jawa Timur.",
    type: "website",
    locale: "id_ID",
    images: [
      {
        url: "/logo.png",
        width: 1200,
        height: 630,
        alt: "CV Duta Engineering Logo",
      },
    ],
  },
  twitter: {
    card: "summary_large_image",
    title: "CV Duta Engineering - Mechanical Seal Specialist",
    description: "Professional Mechanical Seal Solution in Sidoarjo, Jawa Timur",
    images: ["/logo.png"],
  },
}
```

### 11.2 Structured Data (JSON-LD)

Buat file: `src/app/structured-data.tsx`

```typescript
import Script from 'next/script'

export default function StructuredData() {
  const organizationData = {
    "@context": "https://schema.org",
    "@type": "Organization",
    "name": "CV Duta Engineering",
    "legalName": "CV Duta Engineering",
    "url": "https://dutaengineering.com",
    "logo": "https://dutaengineering.com/logo.png",
    "description": "Spesialis Mechanical Seal dan Industrial Sealing Solution terpercaya di Sidoarjo, Jawa Timur.",
    "address": {
      "@type": "PostalAddress",
      "streetAddress": "Jl. Industri No. XX",
      "addressLocality": "Sidoarjo",
      "addressRegion": "Jawa Timur",
      "postalCode": "612XX",
      "addressCountry": "ID"
    },
    "contactPoint": {
      "@type": "ContactPoint",
      "telephone": "+62-812-3456-7890",
      "contactType": "customer service"
    },
    "sameAs": [
      "https://www.facebook.com/dutaengineering",
      "https://www.instagram.com/dutaengineering",
      "https://www.linkedin.com/company/duta-engineering"
    ],
    "founder": "Nama Founder",
    "foundingDate": "2015",
    "areaServed": "Jawa Timur",
    "knowsAbout": [
      "Mechanical Seal",
      "Industrial Sealing Solution",
      "Seal Repair",
      "Pump Seal",
      "Engineering Services"
    ]
  }

  return (
    <Script
      id="structured-data"
      type="application/ld+json"
      dangerouslySetInnerHTML={{
        __html: JSON.stringify(organizationData)
      }}
    />
  )
}
```

Add to `src/app/layout.tsx`:

```typescript
import StructuredData from '@/app/structured-data'

export default function RootLayout({ children }) {
  return (
    <html lang="id">
      <body>
        {children}
        <StructuredData />
      </body>
    </html>
  )
}
```

### 11.3 Robots.txt

Buat file: `public/robots.txt`

```
# Robots.txt - CV Duta Engineering

User-agent: *
Allow: /

# Disallow admin panel
Disallow: /admin/

# Sitemap
Sitemap: https://dutaengineering.com/sitemap.xml

# Crawl delay (opsional)
Crawl-delay: 1
```

### 11.4 Performance Optimization

#### a. Image Optimization

```bash
# Install sharp (jika belum ada)
bun add sharp

# Gunakan Next.js Image component:
import Image from 'next/image'

<Image
  src="/logo.png"
  alt="CV Duta Engineering Logo"
  width={1200}
  height={630}
  priority
/>
```

#### b. Lazy Loading

```typescript
// Untuk banyak gambar di gallery
<Image
  src="/gallery/photo1.jpg"
  alt="Gallery photo"
  width={800}
  height={600}
  loading="lazy"
/>
```

#### c. Font Optimization

```typescript
// Gunakan font-display strategy
const poppins = Poppins({
  variable: "--font-poppins",
  weight: ["300", "400", "500", "600", "700", "800"],
  subsets: ["latin"],
  display: "swap",
  // Tambahkan ini:
  fontDisplay: 'swap',
  preload: true,
})
```

---

## 12. Performance Checklist

### 12.1 Pre-Deploy Checklist

```bash
☑️ Build successful tanpa errors
☑️ Semua environment variables diset
☑️ Images teroptimasi (< 500KB each)
☑️ Meta tags lengkap untuk semua halaman
☑️ Sitemap.xml dibuat
☑️ Robots.txt dibuat
☑️ Structured data (JSON-LD) diimplementasi
☑️ Google Analytics diintegrasikan
☑️ HTTPS certificate disiapkan
☑️ Responsive design tested (mobile, tablet, desktop)
☑️ Cross-browser tested (Chrome, Firefox, Safari, Edge)
☑️ Links internal semua berfungsi
☑️ Contact form diuji
☑️ Admin panel berfungsi
```

### 12.2 Post-Deploy Checklist

```bash
☑️ Website accessible di production URL
☑️ SSL certificate valid (HTTPS working)
☑️ DNS propagation selesai
☑️ Google Search Console verified
☑️ Sitemap submitted ke Google
☑️ Google Analytics tracking active
☑️ Google My Business verified
☑️ Core Web Vitals dalam range:
   - LCP (Largest Contentful Paint): < 2.5s
   - FID (First Input Delay): < 100ms
   - CLS (Cumulative Layout Shift): < 0.1
```

---

## 13. Troubleshooting

### 13.1 Build Errors

**Problem**: Build gagal dengan error

**Solution**:
```bash
# Clear cache dan rebuild
rm -rf .next
bun run build

# Check package.json dependencies
bun install

# Check TypeScript errors
bun run lint
```

### 13.2 Deployment Failed

**Problem**: Deploy ke Vercel gagal

**Solution**:
```bash
# Check Vercel logs
vercel logs duta-engineering-website

# Rebuild and redeploy
vercel --prod --force
```

### 13.3 Google Verification Failed

**Problem**: Tidak bisa verify di Google Search Console

**Solution**:

**Opsi 1: DNS Record**
```bash
# Cek DNS propagation
dig dutaengineering.com TXT

# Pastikan TXT record ada
```

**Opsi 2: HTML File**
```bash
# Pastikan file verification ada di root
curl https://dutaengineering.com/google1234567890abcdef.html

# Harus mengembalikan verification code
```

**Opsi 3: Meta Tag**
```bash
# Check meta tag di source
curl https://dutaengineering.com | grep google-site-verification
```

### 13.4 Website Not Indexing

**Problem**: Google tidak mengindex website

**Solution**:

**Check 1: Robots.txt**
```bash
# Pastikan tidak ada:
Disallow: /

# Boleh ada untuk admin:
Disallow: /admin/
```

**Check 2: Noindex Tag**
```bash
# Pastikan tidak ada:
<meta name="robots" content="noindex">

# Di production, harus:
<meta name="robots" content="index, follow">
```

**Check 3: Canonical URL**
```bash
# Pastikan canonical URL benar
<link rel="canonical" href="https://dutaengineering.com" />
```

**Check 4: Request Manual Indexing**
```
1. Buka Google Search Console
2. Request indexing untuk homepage
3. Request indexing untuk main sections
4. Tunggu 1-3 hari
5. Check coverage report
```

### 13.5 Google Analytics Not Tracking

**Problem**: Google Analytics tidak mencatat data

**Solution**:

**Check 1: Measurement ID**
```bash
# Pastikan NEXT_PUBLIC_GA_MEASUREMENT_ID diset di environment variables
```

**Check 2: Ad Blockers**
```
Buka website di incognito mode atau browser lain
Cek apakah tracking berjalan
```

**Check 3: Debug Mode**
```typescript
// Debug Google Analytics
const GOOGLE_TAG_ID = process.env.NEXT_PUBLIC_GA_MEASUREMENT_ID

<Script
  src={`https://www.googletagmanager.com/gtm.js?id=${GOOGLE_TAG_ID}`}
  data-cookieconsent="ignore" // Untuk bypass consent
/>
```

---

## 📞 Quick Deployment Commands

### Deploy ke Vercel (Recommended)

```bash
# Single command deployment
vercel --prod

# Dengan custom build command
vercel --prod --build-cmd "bun run build"
```

### Deploy ke Netlify

```bash
# Deploy ke Netlify
netlify deploy --prod --dir=.next/standalone
```

### Local Test Production Build

```bash
# Test production build lokal
NODE_ENV=production bun run build
NODE_ENV=production bun run start

# Akses di http://localhost:3000
```

---

## 📊 Monitoring & Maintenance

### Weekly Tasks

```bash
☑️ Check Google Analytics
☑️ Check Google Search Console (errors, coverage)
☑️ Check website uptime
☑️ Review broken links
☑️ Update Google My Business
☑️ Monitor Core Web Vitals
☑️ Check for security vulnerabilities
```

### Monthly Tasks

```bash
☑️ Update website content
☑️ Review and update keywords
☑️ Check competitor rankings
☑️ Backup database and content
☑️ Review performance metrics
☑️ Update sitemap jika ada halaman baru
```

---

## 🎯 Success Criteria

Website CV Duta Engineering sukses jika:

### Technical
- ✅ Website accessible via HTTPS
- ✅ SSL certificate valid
- ✅ Domain pointing correctly
- ✅ All pages loading properly
- ✅ No 404 errors (except intentional)
- ✅ Core Web Vitals passing

### SEO
- ✅ Indexed in Google (search "CV Duta Engineering")
- ✅ Title dan description appearing in SERP
- ✅ Rich snippets showing
- ✅ Google My Business listing appearing
- ✅ Backlinks growing over time

### Performance
- ✅ LCP < 2.5s
- ✅ FID < 100ms
- ✅ CLS < 0.1
- ✅ Mobile page speed > 90
- ✅ Desktop page speed > 90

### Business
- ✅ Contact form working
- ✅ WhatsApp integration functional
- ✅ Phone calls can be made
- ✅ Email delivery working
- ✅ Admin panel accessible

---

## 📚 Additional Resources

### Official Documentation
- Vercel: https://vercel.com/docs
- Netlify: https://docs.netlify.com/
- Next.js: https://nextjs.org/docs
- Google Search Console: https://support.google.com/webmasters/
- Google Analytics: https://support.google.com/analytics/
- Google My Business: https://support.google.com/business/

### Tools
- PageSpeed Insights: https://pagespeed.web.dev/
- Lighthouse: https://developer.chrome.com/docs/lighthouse
- GTmetrix: https://gtmetrix.com/
- Structured Data Testing: https://search.google.com/structured-data/testing-tool/
- Robots.txt Tester: https://www.toolsise.com/robots-txt-validator/

### SEO Tools
- Ahrefs: https://ahrefs.com/
- SEMrush: https://www.semrush.com/
- Ubersuggest: https://neilpatel.com/ubersuggest/
- Keyword Density: https://www.keyworddensitychecker.com/

---

**Dibuat oleh**: Z.ai Code
**Versi**: 1.0.0
**Tanggal**: 15 Januari 2025
**Untuk**: CV Duta Engineering
