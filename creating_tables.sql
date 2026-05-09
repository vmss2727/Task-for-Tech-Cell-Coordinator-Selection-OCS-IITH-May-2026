-- PROFILES TABLE (extends Supabase auth users)
create table if not exists profiles (
  id uuid references auth.users(id) on delete cascade primary key,
  name text not null,
  email text not null,
  role text not null default 'user' check (role in ('admin', 'user', 'viewer')),
  is_active boolean default true,
  created_at timestamptz default now()
);

-- ROOMS TABLE
create table if not exists rooms (
  id uuid primary key default gen_random_uuid(),
  block text not null,
  room_name text not null,
  capacity integer not null,
  is_available boolean default true,
  allowed_purposes text[] default array['OA', 'Interview', 'PPT'],
  notes text,
  created_at timestamptz default now()
);

-- BOOKINGS TABLE
create table if not exists bookings (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id),
  booked_by_name text,
  room_id uuid references rooms(id),
  room_name text,
  block text,
  date date not null,
  start_time time not null,
  end_time time not null,
  purpose text not null check (purpose in ('OA', 'Interview', 'PPT')),
  participants integer not null,
  status text default 'confirmed' check (status in ('confirmed', 'cancelled')),
  created_at timestamptz default now()
);
