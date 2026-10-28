-- Execute no SQL Editor do seu projeto Supabase.
create table if not exists public.fic_workspace (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null default '{"people":[],"chats":[]}'::jsonb
);
alter table public.fic_workspace enable row level security;
revoke all on public.fic_workspace from anon;
grant select, insert, update, delete on public.fic_workspace to authenticated;
create policy "Apenas meus dados" on public.fic_workspace
  for all to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);
