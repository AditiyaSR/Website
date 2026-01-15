#!/bin/bash
# Quick Deploy Script - CV Duta Engineering
# Gunakan script ini untuk deploy cepat ke Vercel/Netlify

set -e

echo "==================================="
echo "CV Duta Engineering - Deploy Script"
echo "==================================="

# Check environment
if [ -z "$NEXT_PUBLIC_GA_MEASUREMENT_ID" ]; then
    echo "⚠️  WARNING: Google Analytics ID belum diset!"
    echo "Set di .env.production: NEXT_PUBLIC_GA_MEASUREMENT_ID=G-XXXXXXXXXX"
fi

# 1. Clean build
echo ""
echo "🧹 Step 1: Cleaning build cache..."
rm -rf .next
echo "✅ Build cache cleaned"

# 2. Install dependencies (if needed)
echo ""
echo "📦 Step 2: Installing dependencies..."
bun install
echo "✅ Dependencies installed"

# 3. Production build
echo ""
echo "🔨 Step 3: Building for production..."
bun run build
if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
else
    echo "❌ Build failed!"
    exit 1
fi

# 4. Ask for deployment target
echo ""
echo "==================================="
echo "Pilih Platform Deployment:"
echo "==================================="
echo "1) Vercel (Rekomendasi)"
echo "2) Netlify"
echo "3) Server Sendiri (Manual)"
echo ""
read -p "Pilih [1-3]: " platform_choice

case $platform_choice in
    1)
        echo ""
        echo "🚀 Deploying to Vercel..."
        vercel --prod
        ;;
    2)
        echo ""
        echo "🚀 Deploying to Netlify..."
        netlify deploy --prod --dir=.next/standalone
        ;;
    3)
        echo ""
        echo "📝 Manual deployment instructions:"
        echo "1. Copy folder .next/standalone ke server"
        echo "2. Setup Nginx/Apache configuration"
        echo "3. Restart server"
        echo ""
        echo "📚 Lihat DEPLOYMENT_GUIDE.md untuk detail"
        ;;
    *)
        echo "❌ Pilihan tidak valid!"
        exit 1
        ;;
esac

echo ""
echo "==================================="
echo "✅ Deployment selesai!"
echo "==================================="
echo ""
echo "Langkah selanjutnya:"
echo "1. Cek URL production website"
echo "2. Verify di Google Search Console"
echo "3. Check Google Analytics tracking"
echo "4. Setup domain (jika belum)"
echo "5. Submit sitemap ke Google"
echo ""
echo "📚 Baca DEPLOYMENT_GUIDE.md untuk detail lengkap"
