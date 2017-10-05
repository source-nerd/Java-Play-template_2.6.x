# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table esa_audit (
  id                            varchar(40) not null,
  user_email                    varchar(255),
  owner_role_role_id            varchar(255),
  location_location_id          varchar(255),
  region_region_id              varchar(255),
  fy                            varchar(255),
  time                          datetime(6),
  last_entry_date               datetime(6),
  status                        varchar(255),
  total_observations            integer not null,
  complied                      integer not null,
  pending                       integer not null,
  constraint pk_esa_audit primary key (id)
);

create table esa_audit_item (
  id                            varchar(40) not null,
  esa_audit_id                  varchar(40),
  audit_point                   TEXT,
  observation                   TEXT,
  recommendation                TEXT,
  status                        varchar(255),
  target_date                   datetime(6),
  revised_date                  datetime(6),
  date_change_count             integer not null,
  category                      varchar(255),
  comments                      TEXT,
  sequence_id                   integer not null,
  compliance_date               datetime(6),
  extension_required            boolean default false not null,
  constraint pk_esa_audit_item primary key (id)
);

create table isa_audit (
  id                            varchar(40) not null,
  user_email                    varchar(255),
  owner_role_role_id            varchar(255),
  location_location_id          varchar(255),
  region_region_id              varchar(255),
  fy                            varchar(255),
  time                          datetime(6),
  last_entry_date               datetime(6),
  status                        varchar(255),
  total_observations            integer not null,
  complied                      integer not null,
  pending                       integer not null,
  constraint pk_isa_audit primary key (id)
);

create table isa_audit_item (
  id                            varchar(40) not null,
  isa_audit_id                  varchar(40),
  audit_point                   TEXT,
  observation                   TEXT,
  recommendation                TEXT,
  status                        varchar(255),
  target_date                   datetime(6),
  revised_date                  datetime(6),
  date_change_count             integer not null,
  category                      varchar(255),
  comments                      TEXT,
  sequence_id                   integer not null,
  compliance_date               datetime(6),
  extension_required            boolean default false not null,
  constraint pk_isa_audit_item primary key (id)
);

create table location (
  location_id                   varchar(255) not null,
  location_name                 varchar(255),
  region_region_id              varchar(255),
  location_type                 varchar(255),
  constraint pk_location primary key (location_id)
);

create table region (
  region_id                     varchar(255) not null,
  region_name                   varchar(255),
  constraint pk_region primary key (region_id)
);

create table role (
  role_id                       varchar(255) not null,
  role_name                     varchar(255),
  constraint pk_role primary key (role_id)
);

create table user (
  email                         varchar(255) not null,
  first_name                    varchar(255),
  last_name                     varchar(255),
  password                      varchar(255),
  role_role_id                  varchar(255),
  location_location_id          varchar(255),
  region_region_id              varchar(255),
  registration_time             datetime(6),
  last_seen                     datetime(6),
  activated                     tinyint(1) default 0 not null,
  constraint pk_user primary key (email)
);

alter table esa_audit add constraint fk_esa_audit_user_email foreign key (user_email) references user (email) on delete restrict on update restrict;
create index ix_esa_audit_user_email on esa_audit (user_email);

alter table esa_audit add constraint fk_esa_audit_owner_role_role_id foreign key (owner_role_role_id) references role (role_id) on delete restrict on update restrict;
create index ix_esa_audit_owner_role_role_id on esa_audit (owner_role_role_id);

alter table esa_audit add constraint fk_esa_audit_location_location_id foreign key (location_location_id) references location (location_id) on delete restrict on update restrict;
create index ix_esa_audit_location_location_id on esa_audit (location_location_id);

alter table esa_audit add constraint fk_esa_audit_region_region_id foreign key (region_region_id) references region (region_id) on delete restrict on update restrict;
create index ix_esa_audit_region_region_id on esa_audit (region_region_id);

alter table esa_audit_item add constraint fk_esa_audit_item_esa_audit_id foreign key (esa_audit_id) references esa_audit (id) on delete restrict on update restrict;
create index ix_esa_audit_item_esa_audit_id on esa_audit_item (esa_audit_id);

alter table isa_audit add constraint fk_isa_audit_user_email foreign key (user_email) references user (email) on delete restrict on update restrict;
create index ix_isa_audit_user_email on isa_audit (user_email);

alter table isa_audit add constraint fk_isa_audit_owner_role_role_id foreign key (owner_role_role_id) references role (role_id) on delete restrict on update restrict;
create index ix_isa_audit_owner_role_role_id on isa_audit (owner_role_role_id);

alter table isa_audit add constraint fk_isa_audit_location_location_id foreign key (location_location_id) references location (location_id) on delete restrict on update restrict;
create index ix_isa_audit_location_location_id on isa_audit (location_location_id);

alter table isa_audit add constraint fk_isa_audit_region_region_id foreign key (region_region_id) references region (region_id) on delete restrict on update restrict;
create index ix_isa_audit_region_region_id on isa_audit (region_region_id);

alter table isa_audit_item add constraint fk_isa_audit_item_isa_audit_id foreign key (isa_audit_id) references isa_audit (id) on delete restrict on update restrict;
create index ix_isa_audit_item_isa_audit_id on isa_audit_item (isa_audit_id);

alter table location add constraint fk_location_region_region_id foreign key (region_region_id) references region (region_id) on delete restrict on update restrict;
create index ix_location_region_region_id on location (region_region_id);

alter table user add constraint fk_user_role_role_id foreign key (role_role_id) references role (role_id) on delete restrict on update restrict;
create index ix_user_role_role_id on user (role_role_id);

alter table user add constraint fk_user_location_location_id foreign key (location_location_id) references location (location_id) on delete restrict on update restrict;
create index ix_user_location_location_id on user (location_location_id);

alter table user add constraint fk_user_region_region_id foreign key (region_region_id) references region (region_id) on delete restrict on update restrict;
create index ix_user_region_region_id on user (region_region_id);


# --- !Downs

alter table esa_audit drop foreign key fk_esa_audit_user_email;
drop index ix_esa_audit_user_email on esa_audit;

alter table esa_audit drop foreign key fk_esa_audit_owner_role_role_id;
drop index ix_esa_audit_owner_role_role_id on esa_audit;

alter table esa_audit drop foreign key fk_esa_audit_location_location_id;
drop index ix_esa_audit_location_location_id on esa_audit;

alter table esa_audit drop foreign key fk_esa_audit_region_region_id;
drop index ix_esa_audit_region_region_id on esa_audit;

alter table esa_audit_item drop foreign key fk_esa_audit_item_esa_audit_id;
drop index ix_esa_audit_item_esa_audit_id on esa_audit_item;

alter table isa_audit drop foreign key fk_isa_audit_user_email;
drop index ix_isa_audit_user_email on isa_audit;

alter table isa_audit drop foreign key fk_isa_audit_owner_role_role_id;
drop index ix_isa_audit_owner_role_role_id on isa_audit;

alter table isa_audit drop foreign key fk_isa_audit_location_location_id;
drop index ix_isa_audit_location_location_id on isa_audit;

alter table isa_audit drop foreign key fk_isa_audit_region_region_id;
drop index ix_isa_audit_region_region_id on isa_audit;

alter table isa_audit_item drop foreign key fk_isa_audit_item_isa_audit_id;
drop index ix_isa_audit_item_isa_audit_id on isa_audit_item;

alter table location drop foreign key fk_location_region_region_id;
drop index ix_location_region_region_id on location;

alter table user drop foreign key fk_user_role_role_id;
drop index ix_user_role_role_id on user;

alter table user drop foreign key fk_user_location_location_id;
drop index ix_user_location_location_id on user;

alter table user drop foreign key fk_user_region_region_id;
drop index ix_user_region_region_id on user;

drop table if exists esa_audit;

drop table if exists esa_audit_item;

drop table if exists isa_audit;

drop table if exists isa_audit_item;

drop table if exists location;

drop table if exists region;

drop table if exists role;

drop table if exists user;

