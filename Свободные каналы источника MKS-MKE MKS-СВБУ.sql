SELECT a.*
FROM (SELECT a.abonent_id, a.bst_type, a.bst_nr, b.kanal, a.count, a.bus_addr, a.sbst_type, a.sbst_nr
      FROM (SELECT a.abonent_id, a.bst_type, a.bst_nr, a.bus_addr, a.sbst_type, a.sbst_nr,
                   CASE WHEN a.bst_type = 'MKS' THEN (32 - count(bst_nr)) WHEN a.bst_type LIKE 'A%S' THEN (28 - count(bst_nr)) END as count
            FROM (
                     SELECT DISTINCT a.*, b.abonent_id as bus_addr, b.bst_type as sbst_type, b.bst_nr as sbst_nr
                     FROM (
                              SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM f7952415767822940get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                              UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM d769305054713560get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                              UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM c2485043296429498get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                              UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM a260290338703446get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                              UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM ae613429596541854get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                              UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM b526745947807181get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                              UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM e686181878568236get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                              UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM sku_svo_laes4418715782306get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                              UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM stk_tg_nt6463275467591get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                              UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM skusb_2015_03_1186081100988665get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                              UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM echsz_laes174110950795955get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                              UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%') AS a
                              LEFT JOIN (
                         SELECT a.abonent_id, a.bus_addr, a.sbst_nr, a.sbst_type, a.bst_type, a.bst_nr
                         FROM (SELECT abonent_id, bus_addr::integer, sbst_nr, sbst_type, bst_type, bst_nr FROM f7952415767822940get.bst
                               UNION SELECT abonent_id, bus_addr::integer, sbst_nr, sbst_type, bst_type, bst_nr FROM d769305054713560get.bst
                               UNION SELECT abonent_id, bus_addr::integer, sbst_nr, sbst_type, bst_type, bst_nr FROM c2485043296429498get.bst
                               UNION SELECT abonent_id, bus_addr::integer, sbst_nr, sbst_type, bst_type, bst_nr FROM a260290338703446get.bst
                               UNION SELECT abonent_id, bus_addr::integer, sbst_nr, sbst_type, bst_type, bst_nr FROM ae613429596541854get.bst
                               UNION SELECT abonent_id, bus_addr::integer, sbst_nr, sbst_type, bst_type, bst_nr FROM b526745947807181get.bst
                               UNION SELECT abonent_id, bus_addr::integer, sbst_nr, sbst_type, bst_type, bst_nr FROM e686181878568236get.bst
                               UNION SELECT abonent_id, bus_addr::integer, sbst_nr, sbst_type, bst_type, bst_nr FROM sku_svo_laes4418715782306get.bst
                               UNION SELECT abonent_id, bus_addr::integer, sbst_nr, sbst_type, bst_type, bst_nr FROM stk_tg_nt6463275467591get.bst
                               UNION SELECT abonent_id, bus_addr::integer, sbst_nr, sbst_type, bst_type, bst_nr FROM skusb_2015_03_1186081100988665get.bst
                               UNION SELECT abonent_id, bus_addr::integer, sbst_nr, sbst_type, bst_type, bst_nr FROM echsz_laes174110950795955get.bst
                               UNION SELECT abonent_id, bus_addr::integer, sbst_nr, sbst_type, bst_type, bst_nr FROM laes_2_blok_1_echsr_k_12008591657336291get.bst) as a
                                  INNER JOIN (
                             SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM f7952415767822940get.Pageleft WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM d769305054713560get.Pageleft WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM c2485043296429498get.Pageleft WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM a260290338703446get.Pageleft WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM ae613429596541854get.Pageleft WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM b526745947807181get.Pageleft WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM e686181878568236get.Pageleft WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM sku_svo_laes4418715782306get.Pageleft WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM stk_tg_nt6463275467591get.Pageleft WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM skusb_2015_03_1186081100988665get.Pageleft WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM echsz_laes174110950795955get.Pageleft WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageleft WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%') AS b
                                             ON a.abonent_id = b.abonent_id and a.bst_type = b.bst_type and a.bst_nr = b.bst_nr
                     ) as b
                                        ON a.abonent_id = b.bus_addr and a.bst_type = b.sbst_type and a.bst_nr = b.sbst_nr
                 ) as a GROUP BY a.abonent_id, a.bst_type, a.bst_nr, a.bus_addr, a.sbst_type, a.sbst_nr) as a
               LEFT JOIN (
          SELECT b.abonent_id, b.bst_type, b.bst_nr, b.kanal
          FROM  (SELECT DISTINCT a.abonent_id, a.bst_type, a.bst_nr, b.kanal FROM (
                                                                                      SELECT DISTINCT a.*
                                                                                      FROM (
                                                                                               SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM f7952415767822940get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM d769305054713560get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM c2485043296429498get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM a260290338703446get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM ae613429596541854get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM b526745947807181get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM e686181878568236get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM sku_svo_laes4418715782306get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM stk_tg_nt6463275467591get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM skusb_2015_03_1186081100988665get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM echsz_laes174110950795955get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%') AS a
                                                                                  ) as a
                                                                                      RIGHT JOIN (SELECT generate_series as kanal FROM generate_series(1,32)) as b ON a.kanal<>b.kanal WHERE a.bst_type = 'MKS') as b
                    LEFT JOIN (
              SELECT DISTINCT a.*
              FROM (
                       SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM f7952415767822940get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM d769305054713560get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM c2485043296429498get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM a260290338703446get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM ae613429596541854get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM b526745947807181get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM e686181878568236get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM sku_svo_laes4418715782306get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM stk_tg_nt6463275467591get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM skusb_2015_03_1186081100988665get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM echsz_laes174110950795955get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%') AS a

          ) as c ON b.abonent_id = c.abonent_id AND b.bst_type = c.bst_type AND b.bst_nr = c.bst_nr AND b.kanal = c.kanal
          WHERE c.kanal is null AND b.bst_type = 'MKS'
          UNION
          SELECT b.abonent_id, b.bst_type, b.bst_nr, b.kanal
          FROM  (SELECT DISTINCT a.abonent_id, a.bst_type, a.bst_nr, b.kanal FROM (
                                                                                      SELECT DISTINCT a.*
                                                                                      FROM (
                                                                                               SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM f7952415767822940get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM d769305054713560get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM c2485043296429498get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM a260290338703446get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM ae613429596541854get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM b526745947807181get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM e686181878568236get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM sku_svo_laes4418715782306get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM stk_tg_nt6463275467591get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM skusb_2015_03_1186081100988665get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM echsz_laes174110950795955get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                                                                                               UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%') AS a
                                                                                  ) as a
                                                                                      RIGHT JOIN (SELECT generate_series as kanal FROM generate_series(1,28)) as b ON a.kanal<>b.kanal WHERE a.bst_type = 'AKS') as b
                    LEFT JOIN (
              SELECT DISTINCT a.*
              FROM (
                       SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM f7952415767822940get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM d769305054713560get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM c2485043296429498get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM a260290338703446get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM ae613429596541854get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM b526745947807181get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM e686181878568236get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM sku_svo_laes4418715782306get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM stk_tg_nt6463275467591get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM skusb_2015_03_1186081100988665get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM echsz_laes174110950795955get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%'
                       UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageright WHERE telegram IS NOT NULL AND telegram NOT LIKE 'BST%') AS a
          ) as c ON b.abonent_id = c.abonent_id AND b.bst_type = c.bst_type AND b.bst_nr = c.bst_nr AND b.kanal = c.kanal
          WHERE c.kanal is null AND (b.bst_type LIKE 'A%S')) as b
                         ON a.abonent_id = b.abonent_id AND a.bst_type = b.bst_type AND a.bst_nr = b.bst_nr
      ORDER BY a.abonent_id, a.bst_type, a.bst_nr, b.kanal
     ) AS a
WHERE a.abonent_id = 536 AND a.bst_type = 'ATS' AND a.bst_nr is not null
