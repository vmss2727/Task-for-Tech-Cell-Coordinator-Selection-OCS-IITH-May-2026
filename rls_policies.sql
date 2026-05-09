alter table profiles enable row level security;

create policy "Users can read own profile"
on profiles
for select
using (
  id = auth.uid()
);

create policy "Users can update own profile"
on profiles
for update
using (
  id = auth.uid()
);
alter table profiles enable row level security;

create policy "Users can read own profile"
on profiles
for select
using (
  id = auth.uid()
);

create policy "Users can update own profile"
on profiles
for update
using (
  id = auth.uid()
);
alter table bookings enable row level security;

create policy "Users can read own bookings"
on bookings
for select
using (
  user_id = auth.uid()
);

create policy "Users can create bookings"
on bookings
for insert
with check (
  user_id = auth.uid()
);

create policy "Users can cancel own bookings"
on bookings
for update
using (
  user_id = auth.uid()
);