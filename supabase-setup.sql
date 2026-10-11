-- Run in Supabase SQL Editor. This schema follows The Embrione challenge brief.
create table if not exists public.members (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  domain text not null,
  position text not null,
  srn text not null unique,
  email text not null,
  linkedin_url text,
  github_url text,
  branch text not null,
  semester integer not null check (semester between 1 and 8),
  bio text,
  photo_url text not null,
  status text not null default 'pending' check (status in ('pending','approved','rejected')),
  created_at timestamptz not null default timezone('utc'::text, now())
);
alter table public.members enable row level security;
-- Challenge-style policies for this recruitment demo. These are intentionally broad;
-- see README before using real/private data in production.
drop policy if exists "Allow public insert" on public.members;
drop policy if exists "Allow public read" on public.members;
drop policy if exists "Allow admin updates" on public.members;
drop policy if exists "Allow admin deletes" on public.members;
create policy "Allow public insert" on public.members for insert to anon, authenticated with check (true);
create policy "Allow public read" on public.members for select to anon, authenticated using (true);
create policy "Allow admin updates" on public.members for update to anon, authenticated using (true) with check (true);
create policy "Allow admin deletes" on public.members for delete to anon, authenticated using (true);
-- Create a PUBLIC Storage bucket named member-photos in Storage > Buckets.
-- Add a storage policy allowing anon uploads to member-photos for this challenge demo.

-- Optional sample directory data (safe to run once; SRNs are unique).
insert into public.members (name,domain,position,srn,email,branch,semester,bio,photo_url,status)
values
('Aarav Menon','Web Development','Head','DEMO-EMB-001','aarav@example.com','CSE',6,'Turning ambitious ideas into thoughtful digital experiences, one line of code at a time.','https://i.pravatar.cc/300?img=12','approved'),
('Ishita Rao','Design','Core Member','DEMO-EMB-002','ishita@example.com','AIML',4,'Designing clear, curious and human-first experiences that make technology feel effortless.','https://i.pravatar.cc/300?img=47','approved'),
('Rohan Shetty','Operations','Vice-Head','DEMO-EMB-003','rohan@example.com','ECE',6,'Building reliable systems behind the scenes and making complex things run smoothly.','https://i.pravatar.cc/300?img=53','approved'),
('Ananya Krish','Social Media','Member','DEMO-EMB-004','ananya@example.com','CSE',4,'Finding the story, shaping the voice and connecting our work with the right people.','https://i.pravatar.cc/300?img=44','approved'),
('Kabir Nair','Event Management','Core Member','DEMO-EMB-005','kabir@example.com','CSE',6,'Making ideas real through well-crafted experiences, teamwork and a little bit of chaos.','https://i.pravatar.cc/300?img=11','approved'),
('Meera Joshi','Sponsorship','Member','DEMO-EMB-006','meera@example.com','AIML',4,'Creating meaningful partnerships that help good ideas grow into something bigger.','https://i.pravatar.cc/300?img=49','approved')
on conflict (srn) do nothing;
