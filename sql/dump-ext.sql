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
00f8b213-f731-42ef-9bf7-344756c9b437	admin@local	$2b$10$F5DDIr6bxxZ.vD3N2mgV9eqKsvlWAAfYyjOK1MLuqWG5gLDvi8N2a	2025-07-19 19:46:45.202019+00		t	t	\N		2025-07-19 19:46:45.202019+00	admin	admin	\N	0	active	2025-07-19 19:46:45.202019+00	01982439-8153-7bc8-856a-c633400ec30c	\N	\N
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
2e07fb58-bc83-418b-912b-c67836162a80	extvol-media	00f8b213-f731-42ef-9bf7-344756c9b437	{/tmp/extvol/media}	{**/@eaDir/**,**/._*,**/#recycle/**,**/#snapshot/**}	2025-07-19 19:48:58.323024+00	2025-07-19 21:27:04.978281+00	\N	2025-07-19 21:27:04.975+00	01982495-5c12-7975-afc0-5d2a2f2441a2
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assets (id, "deviceAssetId", "ownerId", "deviceId", type, "originalPath", "fileCreatedAt", "fileModifiedAt", "isFavorite", duration, "encodedVideoPath", checksum, "livePhotoVideoId", "updatedAt", "createdAt", "originalFileName", "sidecarPath", thumbhash, "isOffline", "libraryId", "isExternal", "deletedAt", "localDateTime", "stackId", "duplicateId", status, "updateId", visibility) FROM stdin;
00000000-0000-0000-0000-000000000000	image.jpg	00f8b213-f731-42ef-9bf7-344756c9b437	Library Import	IMAGE	/tmp/extvol/media/2025/2025-03/image.jpg	2025-07-19 21:26:08.284+00	2025-07-19 21:26:08.285+00	f	\N		\\x4b9b8ec9c1001a9a3f07d926e14e9ecad64c1893	\N	2025-07-19 21:27:05.279707+00	2025-07-19 21:27:04.979399+00	image.jpg	\N	\\x10080e06808987967f8888798878778778890000000000	f	2e07fb58-bc83-418b-912b-c67836162a80	t	\N	2025-07-19 21:26:08.284+00	\N	\N	active	01982495-5d3f-7f33-b063-b4992663584c	timeline
\.


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albums (id, "ownerId", "albumName", "createdAt", "albumThumbnailAssetId", "updatedAt", description, "deletedAt", "isActivityEnabled", "order", "updateId") FROM stdin;
c696e146-99b3-4236-b760-492399e710ca	00f8b213-f731-42ef-9bf7-344756c9b437	My album	2025-07-19 20:33:38.96541+00	00000000-0000-0000-0000-000000000000	2025-07-19 21:28:00.297332+00		\N	t	desc	01982496-3429-7bfc-bda6-973aaeb05b75
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
c696e146-99b3-4236-b760-492399e710ca	00000000-0000-0000-0000-000000000000	2025-07-19 21:28:00.287468+00
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
eecb1f0a-a479-4de4-9e05-13292bd9cdbf	2025-07-19 21:27:05.168013+00	2025-07-19 21:27:05.187357+00	00f8b213-f731-42ef-9bf7-344756c9b437	Marie Curie		f	\N	6d4b0b52-0bbc-487d-a1b8-bda10d57f2b5	f	\N	01982495-5ce3-79e8-a739-416cfc3336fd
f565b65a-5642-4f7d-8e57-df41ce86b981	2025-07-19 21:27:05.168013+00	2025-07-19 21:27:05.187435+00	00f8b213-f731-42ef-9bf7-344756c9b437	Pierre Curie		f	\N	bef8fc78-4c97-42dd-ab5b-5609a05b1ba5	f	\N	01982495-5ce3-70d9-9731-85a3e46f6ce7
\.


--
-- Data for Name: asset_faces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset_faces ("assetId", "personId", "imageWidth", "imageHeight", "boundingBoxX1", "boundingBoxY1", "boundingBoxX2", "boundingBoxY2", id, "sourceType", "deletedAt") FROM stdin;
00000000-0000-0000-0000-000000000000	eecb1f0a-a479-4de4-9e05-13292bd9cdbf	840	700	261	146	356	284	6d4b0b52-0bbc-487d-a1b8-bda10d57f2b5	exif	\N
00000000-0000-0000-0000-000000000000	f565b65a-5642-4f7d-8e57-df41ce86b981	840	700	536	83	618	252	bef8fc78-4c97-42dd-ab5b-5609a05b1ba5	exif	\N
\.


--
-- Data for Name: asset_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset_files (id, "assetId", "createdAt", "updatedAt", type, path, "updateId") FROM stdin;
3a95bdea-74f2-4765-be71-047538c99ffb	00000000-0000-0000-0000-000000000000	2025-07-19 21:27:05.275504+00	2025-07-19 21:27:05.275504+00	preview	upload/thumbs/00f8b213-f731-42ef-9bf7-344756c9b437/67/e5/00000000-0000-0000-0000-000000000000-preview.jpeg	01982495-5d3c-70e7-80de-cff0f410f0ac
1ba8d8a1-ee76-4960-9b95-5b76add03fac	00000000-0000-0000-0000-000000000000	2025-07-19 21:27:05.275504+00	2025-07-19 21:27:05.275504+00	thumbnail	upload/thumbs/00f8b213-f731-42ef-9bf7-344756c9b437/67/e5/00000000-0000-0000-0000-000000000000-thumbnail.webp	01982495-5d3d-74f8-859b-b34334554471
\.


--
-- Data for Name: asset_job_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset_job_status ("assetId", "facesRecognizedAt", "metadataExtractedAt", "duplicatesDetectedAt", "previewAt", "thumbnailAt") FROM stdin;
00000000-0000-0000-0000-000000000000	\N	2025-07-19 21:27:05.202+00	\N	2025-07-19 21:27:05.28+00	2025-07-19 21:27:05.28+00
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
00000000-0000-0000-0000-000000000000	\N	\N	840	700	89134	\N	2025-07-19 21:26:08.284+00	2025-07-19 21:26:08.285+00	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N	8	\N	\N	2025-07-19 21:27:05.160235+00	01982495-5cc8-7efa-aa50-dcb8671b1653
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
2ecac2b4-b2d9-4467-8a80-8881d6a787fe	03g4IgxWwa/4tUj0kqm/g7M+eS5yQoLoXydt3QjGCFE=	2025-07-19 19:46:48.582857+00	2025-07-19 21:23:14.556532+00	00f8b213-f731-42ef-9bf7-344756c9b437	Firefox	macOS	01982491-d7fc-7694-98ad-440e0eb26bd1	\N	\N	\N
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
version-check-state	{"checkedAt": "2025-07-19T21:23:12.096Z", "releaseVersion": "v1.135.3"}
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, "userId", value, "createdAt", "updatedAt", color, "parentId", "updateId") FROM stdin;
f18f414c-c34f-4146-9b5b-e04ef223c034	00f8b213-f731-42ef-9bf7-344756c9b437	People/Marie Curie	2025-07-19 21:27:05.183414+00	2025-07-19 21:27:05.183414+00	\N	501f85c0-0403-4bf6-b265-81c993f75ffa	01982495-5ce0-7dbd-8b79-7e780d83b046
501f85c0-0403-4bf6-b265-81c993f75ffa	00f8b213-f731-42ef-9bf7-344756c9b437	People	2025-07-19 21:27:05.168023+00	2025-07-19 21:27:05.191493+00	\N	\N	01982495-5ce7-709e-94f0-c57cfdba99ee
6e8d349c-b761-47c3-af80-c370e24c07c4	00f8b213-f731-42ef-9bf7-344756c9b437	People/Pierre Curie	2025-07-19 21:27:05.193585+00	2025-07-19 21:27:05.193585+00	\N	501f85c0-0403-4bf6-b265-81c993f75ffa	01982495-5cea-7a03-8c86-b0b1f10417f4
\.


--
-- Data for Name: tag_asset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tag_asset ("assetsId", "tagsId") FROM stdin;
00000000-0000-0000-0000-000000000000	f18f414c-c34f-4146-9b5b-e04ef223c034
00000000-0000-0000-0000-000000000000	6e8d349c-b761-47c3-af80-c370e24c07c4
\.


--
-- Data for Name: tags_closure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags_closure (id_ancestor, id_descendant) FROM stdin;
501f85c0-0403-4bf6-b265-81c993f75ffa	501f85c0-0403-4bf6-b265-81c993f75ffa
f18f414c-c34f-4146-9b5b-e04ef223c034	f18f414c-c34f-4146-9b5b-e04ef223c034
501f85c0-0403-4bf6-b265-81c993f75ffa	f18f414c-c34f-4146-9b5b-e04ef223c034
6e8d349c-b761-47c3-af80-c370e24c07c4	6e8d349c-b761-47c3-af80-c370e24c07c4
501f85c0-0403-4bf6-b265-81c993f75ffa	6e8d349c-b761-47c3-af80-c370e24c07c4
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

