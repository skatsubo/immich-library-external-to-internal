--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17 (Debian 14.17-1.pgdg120+1)
-- Dumped by pg_dump version 14.17 (Debian 14.17-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, "createdAt", "profileImagePath", "isAdmin", "shouldChangePassword", "deletedAt", "oauthId", "updatedAt", "storageLabel", name, "quotaSizeInBytes", "quotaUsageInBytes", status, "profileChangedAt", "updateId", "avatarColor", "pinCode") FROM stdin;
00f8b213-f731-42ef-9bf7-344756c9b437	admin@local	$2b$10$F5DDIr6bxxZ.vD3N2mgV9eqKsvlWAAfYyjOK1MLuqWG5gLDvi8N2a	2025-07-19 19:46:45.202019+00		t	t	\N		2025-07-19 20:45:51.758792+00	admin	admin	\N	89134	active	2025-07-19 19:46:45.202019+00	0198246f-9f0e-7e76-98c2-1bec27920fe5	\N	\N
\.


--
-- Data for Name: asset_stack; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset_stack (id, "primaryAssetId", "ownerId") FROM stdin;
\.


--
-- Data for Name: libraries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libraries (id, name, "ownerId", "importPaths", "exclusionPatterns", "createdAt", "updatedAt", "deletedAt", "refreshedAt", "updateId") FROM stdin;
2e07fb58-bc83-418b-912b-c67836162a80	extvol-media	00f8b213-f731-42ef-9bf7-344756c9b437	{/tmp/extvol/media}	{**/@eaDir/**,**/._*,**/#recycle/**,**/#snapshot/**}	2025-07-19 19:48:58.323024+00	2025-07-19 20:10:30.411286+00	\N	\N	0198244f-408b-770a-b07c-73fc85c18f91
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assets (id, "deviceAssetId", "ownerId", "deviceId", type, "originalPath", "fileCreatedAt", "fileModifiedAt", "isFavorite", duration, "encodedVideoPath", checksum, "livePhotoVideoId", "updatedAt", "createdAt", "originalFileName", "sidecarPath", thumbhash, "isOffline", "libraryId", "isExternal", "deletedAt", "localDateTime", "stackId", "duplicateId", status, "updateId", visibility) FROM stdin;
00000000-0000-0000-0000-000000000000	web-image.jpg-1745954745194	00f8b213-f731-42ef-9bf7-344756c9b437	WEB	IMAGE	upload/library/admin/2025/2025-04/image.jpg	2025-04-29 19:25:45+00	2025-04-29 19:25:45+00	f	\N		\\xf73a17059f4aedaeef82579b8ee58bcb18c7f90b	\N	2025-07-19 20:45:52.061325+00	2025-07-19 20:45:51.736455+00	image.jpg	\N	\\x10080e06808987967f8888798878778778890000000000	f	\N	f	\N	2025-04-29 19:25:45+00	\N	\N	active	0198246f-a03d-73ef-8779-c11f9c9e204a	timeline
\.


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albums (id, "ownerId", "albumName", "createdAt", "albumThumbnailAssetId", "updatedAt", description, "deletedAt", "isActivityEnabled", "order", "updateId") FROM stdin;
c696e146-99b3-4236-b760-492399e710ca	00f8b213-f731-42ef-9bf7-344756c9b437	My album	2025-07-19 20:33:38.96541+00	00000000-0000-0000-0000-000000000000	2025-07-19 21:30:42.402578+00		\N	t	desc	01982498-ad62-7a4d-ad08-0204ae2532b4
\.


--
-- Data for Name: activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity (id, "createdAt", "updatedAt", "albumId", "userId", "assetId", comment, "isLiked", "updateId") FROM stdin;
\.


--
-- Data for Name: album_users_audit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.album_users_audit (id, "albumId", "userId", "deletedAt") FROM stdin;
\.


--
-- Data for Name: albums_assets_assets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albums_assets_assets ("albumsId", "assetsId", "createdAt") FROM stdin;
c696e146-99b3-4236-b760-492399e710ca	00000000-0000-0000-0000-000000000000	2025-07-19 21:30:42.394931+00
\.


--
-- Data for Name: albums_audit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albums_audit (id, "albumId", "userId", "deletedAt") FROM stdin;
\.


--
-- Data for Name: albums_shared_users_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albums_shared_users_users ("albumsId", "usersId", role, "updateId", "updatedAt", "createId", "createdAt") FROM stdin;
\.


--
-- Data for Name: api_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_keys (name, key, "userId", "createdAt", "updatedAt", id, permissions, "updateId") FROM stdin;
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (id, "createdAt", "updatedAt", "ownerId", name, "thumbnailPath", "isHidden", "birthDate", "faceAssetId", "isFavorite", color, "updateId") FROM stdin;
2cdb9fad-80cf-42e7-b8a5-ec501537f6ae	2025-07-19 20:45:51.942513+00	2025-07-19 20:45:51.956335+00	00f8b213-f731-42ef-9bf7-344756c9b437	Pierre Curie		f	\N	464b46ab-479b-4664-b731-0dfe516874f4	f	\N	0198246f-9fd4-79cc-bdd2-6d6045ff7d7c
eb9a38ae-2f91-4430-99ee-dc984305c317	2025-07-19 20:45:51.942513+00	2025-07-19 20:45:51.98987+00	00f8b213-f731-42ef-9bf7-344756c9b437	Marie Curie	upload/thumbs/00f8b213-f731-42ef-9bf7-344756c9b437/eb/9a/eb9a38ae-2f91-4430-99ee-dc984305c317.jpeg	f	\N	c140f267-e8f2-4a81-a5e8-40accf14c4df	f	\N	0198246f-9ff5-7e5c-8cca-0e52dc795c8d
\.


--
-- Data for Name: asset_faces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset_faces ("assetId", "personId", "imageWidth", "imageHeight", "boundingBoxX1", "boundingBoxY1", "boundingBoxX2", "boundingBoxY2", id, "sourceType", "deletedAt") FROM stdin;
00000000-0000-0000-0000-000000000000	eb9a38ae-2f91-4430-99ee-dc984305c317	840	700	261	146	356	284	c140f267-e8f2-4a81-a5e8-40accf14c4df	exif	\N
00000000-0000-0000-0000-000000000000	2cdb9fad-80cf-42e7-b8a5-ec501537f6ae	840	700	536	83	618	252	464b46ab-479b-4664-b731-0dfe516874f4	exif	\N
\.


--
-- Data for Name: asset_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset_files (id, "assetId", "createdAt", "updatedAt", type, path, "updateId") FROM stdin;
57b36c89-9c4e-48d5-9af3-4dce50ad2ac9	00000000-0000-0000-0000-000000000000	2025-07-19 20:45:52.057726+00	2025-07-19 20:45:52.057726+00	preview	upload/thumbs/00f8b213-f731-42ef-9bf7-344756c9b437/c6/ba/00000000-0000-0000-0000-000000000000-preview.jpeg	0198246f-a03a-7005-a88e-61585f2a039b
b201b756-5554-4f7a-bbe9-4fc828652d57	00000000-0000-0000-0000-000000000000	2025-07-19 20:45:52.057726+00	2025-07-19 20:45:52.057726+00	thumbnail	upload/thumbs/00f8b213-f731-42ef-9bf7-344756c9b437/c6/ba/00000000-0000-0000-0000-000000000000-thumbnail.webp	0198246f-a03b-7215-b2e7-ee7aad98717e
\.


--
-- Data for Name: asset_job_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset_job_status ("assetId", "facesRecognizedAt", "metadataExtractedAt", "duplicatesDetectedAt", "previewAt", "thumbnailAt") FROM stdin;
00000000-0000-0000-0000-000000000000	\N	2025-07-19 20:45:51.969+00	\N	2025-07-19 20:45:52.061+00	2025-07-19 20:45:52.061+00
\.


--
-- Data for Name: assets_audit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assets_audit (id, "assetId", "ownerId", "deletedAt") FROM stdin;
\.


--
-- Data for Name: audit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit (id, "entityType", "entityId", action, "ownerId", "createdAt") FROM stdin;
\.


--
-- Data for Name: exif; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exif ("assetId", make, model, "exifImageWidth", "exifImageHeight", "fileSizeInByte", orientation, "dateTimeOriginal", "modifyDate", "lensModel", "fNumber", "focalLength", iso, latitude, longitude, city, state, country, description, fps, "exposureTime", "livePhotoCID", "timeZone", "projectionType", "profileDescription", colorspace, "bitsPerSample", "autoStackId", rating, "updatedAt", "updateId") FROM stdin;
00000000-0000-0000-0000-000000000000	\N	\N	840	700	89134	\N	2025-04-29 19:25:45+00	2025-04-29 19:25:45+00	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N	8	\N	\N	2025-07-19 20:45:51.933249+00	0198246f-9fbd-7adb-b2d2-8a8c4e40f56d
\.


--
-- Data for Name: face_search; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.face_search ("faceId", embedding) FROM stdin;
\.


--
-- Data for Name: kysely_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kysely_migrations (name, "timestamp") FROM stdin;
1744910873969-InitialMigration	2025-07-19T19:46:01.611Z
1744991379464-AddNotificationsTable	2025-07-19T19:46:01.617Z
1745244781846-AddUserAvatarColorColumn	2025-07-19T19:46:01.618Z
1745902563899-AddAssetVisibilityColumn	2025-07-19T19:46:01.621Z
1746636476623-DropExtraIndexes	2025-07-19T19:46:01.626Z
1746768490606-AddUserPincode	2025-07-19T19:46:01.626Z
1746844028242-AddLockedVisibilityEnum	2025-07-19T19:46:01.627Z
1746987967923-AddPinExpiresAtColumn	2025-07-19T19:46:01.627Z
1747329504572-AddNewSessionColumns	2025-07-19T19:46:01.629Z
1747338664832-SessionRename	2025-07-19T19:46:01.630Z
1747664684909-AddAlbumAuditTables	2025-07-19T19:46:01.643Z
1749067526135-UserOnboardingDefault	2025-07-19T19:46:01.644Z
1750107668827-PartnerCreateId	2025-07-19T19:46:01.647Z
1750189909087-AddAlbumUserCreateFields	2025-07-19T19:46:01.653Z
1750323941566-UnsetPrewarmDimParameter	2025-07-19T19:46:01.654Z
\.


--
-- Data for Name: kysely_migrations_lock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kysely_migrations_lock (id, is_locked) FROM stdin;
migration_lock	0
\.


--
-- Data for Name: memories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.memories (id, "createdAt", "updatedAt", "deletedAt", "ownerId", type, data, "isSaved", "memoryAt", "seenAt", "showAt", "hideAt", "updateId") FROM stdin;
\.


--
-- Data for Name: memories_assets_assets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.memories_assets_assets ("memoriesId", "assetsId") FROM stdin;
\.


--
-- Data for Name: move_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.move_history (id, "entityId", "pathType", "oldPath", "newPath") FROM stdin;
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, "createdAt", "updatedAt", "deletedAt", "updateId", "userId", level, type, data, title, description, "readAt") FROM stdin;
\.


--
-- Data for Name: partners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partners ("sharedById", "sharedWithId", "createdAt", "updatedAt", "inTimeline", "updateId", "createId") FROM stdin;
\.


--
-- Data for Name: partners_audit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partners_audit (id, "sharedById", "sharedWithId", "deletedAt") FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, token, "createdAt", "updatedAt", "userId", "deviceType", "deviceOS", "updateId", "pinExpiresAt", "expiresAt", "parentId") FROM stdin;
2ecac2b4-b2d9-4467-8a80-8881d6a787fe	03g4IgxWwa/4tUj0kqm/g7M+eS5yQoLoXydt3QjGCFE=	2025-07-19 19:46:48.582857+00	2025-07-19 20:46:52.444352+00	00f8b213-f731-42ef-9bf7-344756c9b437	Firefox	macOS	01982470-8c1c-7622-a05f-ac7503850d74	\N	\N	\N
\.


--
-- Data for Name: session_sync_checkpoints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.session_sync_checkpoints ("sessionId", type, "createdAt", "updatedAt", ack, "updateId") FROM stdin;
\.


--
-- Data for Name: shared_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shared_links (id, description, "userId", key, type, "createdAt", "expiresAt", "allowUpload", "albumId", "allowDownload", "showExif", password) FROM stdin;
\.


--
-- Data for Name: shared_link__asset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shared_link__asset ("assetsId", "sharedLinksId") FROM stdin;
\.


--
-- Data for Name: smart_search; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.smart_search ("assetId", embedding) FROM stdin;
\.


--
-- Data for Name: system_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_metadata (key, value) FROM stdin;
system-flags	{"mountChecks": {"thumbs": true, "upload": true, "backups": true, "library": true, "profile": true, "encoded-video": true}}
reverse-geocoding-state	{"lastUpdate": "2025-05-06T11:19:15+00:00", "lastImportFileName": "cities500.txt"}
admin-onboarding	{"isOnboarded": true}
system-config	{"metadata": {"faces": {"import": true}}, "machineLearning": {"enabled": false}, "storageTemplate": {"enabled": true, "template": "{{y}}/{{y}}-{{MM}}/{{filename}}"}}
version-check-state	{"checkedAt": "2025-07-19T21:30:33.904Z", "releaseVersion": "v1.135.3"}
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, "userId", value, "createdAt", "updatedAt", color, "parentId", "updateId") FROM stdin;
66c9ecc6-ab81-4e95-a0a0-060a078975c6	00f8b213-f731-42ef-9bf7-344756c9b437	People/Marie Curie	2025-07-19 20:45:51.951206+00	2025-07-19 20:45:51.951206+00	\N	9fa81a87-fa3d-4343-afec-16e8479a7e8c	0198246f-9fd1-798e-9c01-41c3e6bf18f9
9fa81a87-fa3d-4343-afec-16e8479a7e8c	00f8b213-f731-42ef-9bf7-344756c9b437	People	2025-07-19 20:45:51.939795+00	2025-07-19 20:45:51.96105+00	\N	\N	0198246f-9fd9-7cbf-b6ee-db6d5382841f
c538ce32-4256-4c3a-a72b-7cc8b5cf091b	00f8b213-f731-42ef-9bf7-344756c9b437	People/Pierre Curie	2025-07-19 20:45:51.962632+00	2025-07-19 20:45:51.962632+00	\N	9fa81a87-fa3d-4343-afec-16e8479a7e8c	0198246f-9fdb-7a63-a41a-fb9a52ae6a67
\.


--
-- Data for Name: tag_asset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tag_asset ("assetsId", "tagsId") FROM stdin;
00000000-0000-0000-0000-000000000000	66c9ecc6-ab81-4e95-a0a0-060a078975c6
00000000-0000-0000-0000-000000000000	c538ce32-4256-4c3a-a72b-7cc8b5cf091b
\.


--
-- Data for Name: tags_closure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags_closure (id_ancestor, id_descendant) FROM stdin;
9fa81a87-fa3d-4343-afec-16e8479a7e8c	9fa81a87-fa3d-4343-afec-16e8479a7e8c
66c9ecc6-ab81-4e95-a0a0-060a078975c6	66c9ecc6-ab81-4e95-a0a0-060a078975c6
9fa81a87-fa3d-4343-afec-16e8479a7e8c	66c9ecc6-ab81-4e95-a0a0-060a078975c6
c538ce32-4256-4c3a-a72b-7cc8b5cf091b	c538ce32-4256-4c3a-a72b-7cc8b5cf091b
9fa81a87-fa3d-4343-afec-16e8479a7e8c	c538ce32-4256-4c3a-a72b-7cc8b5cf091b
\.


--
-- Data for Name: user_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_metadata ("userId", key, value) FROM stdin;
00f8b213-f731-42ef-9bf7-344756c9b437	onboarding	{"isOnboarded": true}
00f8b213-f731-42ef-9bf7-344756c9b437	preferences	{"folders": {"enabled": true, "sidebarWeb": true}}
\.


--
-- Data for Name: users_audit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_audit ("userId", "deletedAt", id) FROM stdin;
\.


--
-- Data for Name: version_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.version_history (id, "createdAt", version) FROM stdin;
3f719d28-f53c-4ef3-bbf2-b935b7aacd36	2025-07-19 19:46:02.009886+00	1.135.3
\.


--
-- Name: audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audit_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

