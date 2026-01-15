import bcrypt from 'bcrypt'
import { db } from './src/lib/db'

async function main() {
  // Check if admin user exists
  const existingAdmin = await db.user.findUnique({
    where: { email: 'admin@dutaengineering.com' }
  })

  if (!existingAdmin) {
    // Create default admin user
    const hashedPassword = await bcrypt.hash('admin123', 10)

    const admin = await db.user.create({
      data: {
        email: 'admin@dutaengineering.com',
        name: 'Admin',
        password: hashedPassword,
        role: 'admin'
      }
    })

    console.log('✅ Admin user created successfully!')
    console.log('📧 Email: admin@dutaengineering.com')
    console.log('🔑 Password: admin123')
    console.log('\n⚠️  Please change the password after first login!')
  } else {
    console.log('ℹ️  Admin user already exists')
  }

  // Initialize default content if not exists
  const existingSettings = await db.siteSettings.findFirst()

  if (!existingSettings) {
    await db.siteSettings.create({
      data: {
        companyName: 'CV Duta Engineering',
        tagline: 'Mechanical Seal Specialist',
        email: 'info@dutaengineering.com',
        phone: '+62 812-3456-7890',
        whatsapp: '+62 812-3456-7890',
        address: 'Jl. Industri No. XX, Sidoarjo',
        city: 'Sidoarjo',
        province: 'Jawa Timur',
        country: 'Indonesia',
        seoTitle: 'CV Duta Engineering - Professional Mechanical Seal Solution in Sidoarjo',
        seoDescription: 'CV Duta Engineering adalah spesialis Mechanical Seal dan Industrial Sealing Solution terpercaya di Sidoarjo, Jawa Timur.'
      }
    })
    console.log('✅ Default site settings created!')
  }
}

main()
  .catch((e) => {
    console.error('Error seeding database:', e)
    process.exit(1)
  })
  .finally(async () => {
    await db.$disconnect()
  })
