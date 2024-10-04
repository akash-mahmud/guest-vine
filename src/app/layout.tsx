import type { Metadata } from "next";
import localFont from "next/font/local";
import "./globals.css";
import {
  ClerkProvider,

} from '@clerk/nextjs'
import NavBar from "@/components/layout/NavBar";
import { ThemeProvider } from "@/components/theme-provider";
const geistSans = localFont({
  src: "./fonts/GeistVF.woff",
  variable: "--font-geist-sans",
  weight: "100 900",
});
const geistMono = localFont({
  src: "./fonts/GeistMonoVF.woff",
  variable: "--font-geist-mono",
  weight: "100 900",
});

export const metadata: Metadata = {
  title: "Guest Vine",
  description: "Hotel booking app",
  icons: {
    icon: "/logo.ico"
  }
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <ClerkProvider>

      <html lang="en" suppressHydrationWarning>
      <ThemeProvider
            attribute="class"
            defaultTheme="system"
            enableSystem
            disableTransitionOnChange
          >
        <body
          className={`${geistSans.variable} ${geistMono.variable} antialiased`}
        >

          <main className=" flex flex-col min-h-screen bg-secondary">

            <NavBar />
            <section className=" flex-grow">
              {children}

            </section>
          </main>

        </body>
        </ThemeProvider>
      </html>
    </ClerkProvider>
  );
}
