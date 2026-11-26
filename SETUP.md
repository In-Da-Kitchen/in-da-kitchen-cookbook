# In Da Kitchen Cookbook — free setup

This is a ready-to-customize website starter. It runs in preview mode immediately with three sample recipes. To make recipes and uploaded photos sync for every visitor, connect a free Supabase project and deploy the site.

## 1) Create the shared cloud database (free tier)
1. Create a project at https://supabase.com (choose the free plan).
2. In **Authentication → Users**, create your owner account with your email and a strong password.
3. Copy your account's **User UID** from Authentication → Users.
4. Open `supabase_setup.sql`, replace `OWNER_USER_UUID` with that exact UID, then run the SQL in **SQL Editor**.
5. In **Authentication → Settings**, disable public sign-ups so nobody else can create an account.
6. In **Project Settings → API**, copy the Project URL and `anon` / publishable key.
5. Open `index.html` in a text editor and replace:
   - `YOUR_SUPABASE_PROJECT_URL`
   - `YOUR_SUPABASE_ANON_KEY`
   with those values. The anon key is intended for browser use; never put a service-role key in this website.

## 2) Publish it free
1. Create a GitHub account and a new **public** repository named `in-da-kitchen-cookbook`.
2. Upload `index.html`.
3. In the repository, open **Settings → Pages**, choose **Deploy from a branch**, select `main` and `/root`, then Save.
4. GitHub Pages will provide a public website URL. Share that URL with family and friends.

## 3) Owner and visitor permissions
- Visitors can read recipes without signing in.
- Only the specific owner account whose UUID you inserted into the SQL policies can add, edit, or delete recipes.
- Only the authenticated owner can upload recipe photos.
- Keep your owner password private. Do not share your Supabase service-role key.

## 4) Customize
Edit the colors, title, welcome text, categories, and hero photo in `index.html`. The sample recipes are preview-only and are replaced by cloud recipes after Supabase is connected.

## Important free-tier note
Supabase and GitHub Pages have free plans with usage limits and terms that can change. Keep a backup of your recipes and check current plan limits. This starter uses a public read-only recipe catalog; do not put private or sensitive information in it.
