# The Embrione — Meet the Team

A responsive, dark editorial-style onboarding and moderation experience built for The Embrione Web Development recruitment challenge. Includes `/register`, `/admin`, and `/team`.

## Features

- Live member-card preview while completing the registration form
- Browser-side image conversion to WebP (max width 800px, quality 0.8)
- Profile submission with pending status and duplicate-SRN check
- Admin moderation view with total, pending, and approved counts; approve, reject, and delete actions
- Public directory shows approved profiles only, with domain, position, and text filters
- Responsive layout, sample approved profiles, keyboard-friendly form controls
- Supabase database and Storage integration when environment variables are configured
- Local demo mode using browser storage when Supabase is not configured

## Stack

React + Vite · React Router · custom CSS · Lucide icons · Supabase (Postgres + Storage)

## Run locally

```bash
npm install
npm run dev
```

Open the local URL shown in your terminal.

## Connect Supabase

1. Create a project in [Supabase](https://supabase.com).
2. In SQL Editor, run `supabase-setup.sql`.
3. In Storage, create a **public** bucket named `member-photos`.
4. Create `.env.local` from `.env.example` and add your project URL and publishable key:

```env
VITE_SUPABASE_URL=https://YOUR_PROJECT.supabase.co
VITE_SUPABASE_PUBLISHABLE_KEY=YOUR_PUBLISHABLE_KEY
```

5. Restart `npm run dev`. On Vercel, add the same variables under Project Settings → Environment Variables, then redeploy.

Without those variables, the site uses localStorage demo data. Local demo submissions are only stored in the browser they were submitted from; configure Supabase to share submissions between devices.

## Admin demo login

- Email: `admin@embrione.pes.edu`
- Password: `EmbrioneAdmin@2026`

**Important security note:** the challenge supplies universal admin credentials. This demo checks them in the client, so it is not production-grade authentication. The challenge-style SQL policies also allow broad updates/deletes. For real private data, use Supabase Auth and enforce admin-only operations with server-side checks/RLS policies. Never put a Supabase `service_role` key in a frontend environment variable.

## Deploy to GitHub + Vercel

1. Create a **public** GitHub repository named `saketh-embrione-task` (or another name you prefer).
2. From this folder run:

```bash
git init
git add .
git commit -m "chore: initialize Embrione recruitment task"
git branch -M main
git remote add origin https://github.com/YOUR_GITHUB_USERNAME/saketh-embrione-task.git
git push -u origin main
```

3. Open [Vercel](https://vercel.com), choose **Add New → Project**, import the GitHub repository, and deploy. Vercel detects Vite automatically; use `npm run build` as the build command and `dist` as the output directory if asked.
4. Add Supabase environment variables in Vercel before the final deployment.
5. In Vercel Project Settings → Domains, use the required challenge format: `saketh-embrione-task.vercel.app` (the brief's format is `https://<yourfirstname>-embrione-task.vercel.app`; if `saketh` is unavailable, use `saketh<last-3-of-SRN>-embrione-task`). Vercel must confirm the subdomain is available.
6. Test `/register`, `/admin`, and `/team` on the deployed URL. Approve a profile in `/admin` and verify it appears in `/team`.

## Suggested progressive commits

```bash
git add . && git commit -m "feat: add registration form and live preview"
git add . && git commit -m "feat: convert profile photos to WebP"
git add . && git commit -m "feat: add admin moderation workflow"
git add . && git commit -m "feat: add searchable team directory"
git add . && git commit -m "style: polish responsive dark interface"
```

Use progressive commits as you build, rather than presenting all work as if it happened in one commit. Be ready to explain the components and data flow in your demo.
