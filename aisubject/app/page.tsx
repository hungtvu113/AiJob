'use client';

import dynamic from 'next/dynamic';
import Navbar from './components/Navbar';
import HeroSection from './components/HeroSection';
import FeaturesSection from './components/FeaturesSection';
import HowItWorksSection from './components/HowItWorksSection';
import TestimonialsSection from './components/TestimonialsSection';
import CTASection from './components/CTASection';
import Footer from './components/Footer';

// Dynamic import for ParticleBackground to avoid SSR issues
const ParticleBackground = dynamic(() => import('./components/ParticleBackground'), {
  ssr: false,
});

// Dynamic import for AIRobotMascot
const AIRobotMascot = dynamic(() => import('./components/AIRobotMascot'), {
  ssr: false,
});

export default function Home() {
  return (
    <main className="relative">
      {/* Noise overlay */}
      <div className="noise-overlay" />
      
      {/* Particle background */}
      <ParticleBackground />
      
      {/* AI Robot Mascot */}
      <AIRobotMascot />
      
      {/* Navigation */}
      <Navbar />
      
      {/* Sections */}
      <HeroSection />
      <FeaturesSection />
      <HowItWorksSection />
      <TestimonialsSection />
      <CTASection />
      <Footer />
    </main>
  );
}
