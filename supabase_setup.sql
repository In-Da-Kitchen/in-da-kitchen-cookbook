-- Run this in Supabase SQL Editor AFTER creating your owner account.
-- Replace OWNER_USER_UUID below with your user's UUID from Authentication -> Users.
-- Also disable public sign-ups in Authentication settings.

create table if not exists public.recipes (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  category text,
  time text,
  servings text,
  description text,
  ingredients text[] not null default '{}',
  instructions text[] not null default '{}',
  notes text,
  image_url text,
  created_at timestamptz not null default now()
);

alter table public.recipes enable row level security;

create policy "Anyone can read recipes"
on public.recipes for select to anon, authenticated using (true);

create policy "Owner can insert recipes"
on public.recipes for insert to authenticated
with check (auth.uid() = 'OWNER_USER_UUID'::uuid);

create policy "Owner can update recipes"
on public.recipes for update to authenticated
using (auth.uid() = 'OWNER_USER_UUID'::uuid)
with check (auth.uid() = 'OWNER_USER_UUID'::uuid);

create policy "Owner can delete recipes"
on public.recipes for delete to authenticated
using (auth.uid() = 'OWNER_USER_UUID'::uuid);

insert into storage.buckets (id, name, public)
values ('recipe-photos', 'recipe-photos', true)
on conflict (id) do update set public = true;

create policy "Anyone can view recipe photos"
on storage.objects for select to anon, authenticated
using (bucket_id = 'recipe-photos');

create policy "Owner can upload recipe photos"
on storage.objects for insert to authenticated
with check (bucket_id = 'recipe-photos' and auth.uid() = 'OWNER_USER_UUID'::uuid);

create policy "Owner can update recipe photos"
on storage.objects for update to authenticated
using (bucket_id = 'recipe-photos' and auth.uid() = 'OWNER_USER_UUID'::uuid)
with check (bucket_id = 'recipe-photos' and auth.uid() = 'OWNER_USER_UUID'::uuid);

create policy "Owner can delete recipe photos"
on storage.objects for delete to authenticated
using (bucket_id = 'recipe-photos' and auth.uid() = 'OWNER_USER_UUID'::uuid);
