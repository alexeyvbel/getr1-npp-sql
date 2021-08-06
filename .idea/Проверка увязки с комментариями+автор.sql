SELECT DISTINCT CASE WHEN (foo.out_kks IS NULL AND foo.in_kks IS NOT NULL) THEN 'ОПРЕДЕЛИ ПЕРЕДАЧУ СИГНАЛА СО СТОРОНЫ ИСТОЧНИКА'
                     WHEN (foo.out_kks IS NOT NULL AND foo.in_kks IS NULL) THEN 'ОПРЕДЕЛИ ПЕРЕДАЧУ СИГНАЛА СО СТОРОНЫ ПРИЕМНИКА'
                     WHEN (foo.out_bus_addr IS NULL and foo.out_bstno IS NOT NULL) THEN 'УВЯЖИ СО СТОРОНЫ ПРИЕМНИКА'
                     WHEN ((foo.out_bstno IS NULL AND foo.out_kanal IS NOT NULL) OR (foo.in_bstno IS NULL AND foo.in_kanal IS NOT NULL)) THEN 'УДАЛИ БИТЫ'
                     WHEN (foo.out_kanal<>foo.in_kanal) THEN 'УВЯЖИ БИТЫ В ТЕЛЕГРАММЕ'
                     WHEN (foo.out_sbstno<>foo.in_bstno) THEN 'НОМ_ТЕЛ ИСТ НЕ СВЯЗАН С НОМ_ТЕЛ ПРИЕМ'
                     WHEN (foo.out_bus_addr<>foo.in_abonent) THEN 'ОШИБКА АБ_ИСТ В ПАРАМ АБ_ПРИЕМ'
                    END as "ПРИМЕЧАНИЕ", foo.*
FROM (
         SELECT DISTINCT e.abonent_id AS out_abonent, e.page as out_kks, e.page_no as out_kks_no, e.signalcode as out_sigcode, e.bst_type as out_bstype, e.bst_nr as out_bstno, e.kanal as out_kanal,
                         k.abonent_id as in_abonent, k.page as in_kks, k.page_no as in_kks_no, k.signalcode as in_sigcode, 0 as out_bus_addr, NULL as out_sbstype, NULL as out_sbstno,
                         e.pageright_no, k.bst_type, k.bst_nr as in_bstno, k.pageleft, k.pageleft_no, e.pageright as pagerightkks, k.kanal AS in_kanal
         FROM (
                  SELECT DISTINCT c.abonent_id, d.page_kks as page, d.page_no, c.signalcode, c.bst_type, c.bst_nr, c.kanal, c.pageright, c.pageright_no, c.page_id, c.description, c.setting
                  FROM (SELECT DISTINCT q.abonent_id, q.signalcode, q.bst_type, q.bst_nr, q.kanal, q.pageright, q.pageright_no, q.page_id, q.description, q.setting
                        FROM (SELECT DISTINCT a.abonent_id, b.signalcode, a.pageright, a.pageright_no, a.bst_type, a.bst_nr, a.kanal, a.page_id, b.description, b.setting
                              FROM
                                  (SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM f7952415767822940get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM d769305054713560get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM c2485043296429498get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM a260290338703446get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM ae613429596541854get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM b526745947807181get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM e686181878568236get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM sku_svo_laes4418715782306get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM stk_tg_nt6463275467591get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM skusb_2015_03_1186081100988665get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM echsz_laes174110950795955get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageright WHERE block_id='0' and page<>'')
                                      AS a
                                      INNER JOIN
                                  (SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM f7952415767822940get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM d769305054713560get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM c2485043296429498get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM a260290338703446get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM ae613429596541854get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM b526745947807181get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM e686181878568236get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM sku_svo_laes4418715782306get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM stk_tg_nt6463275467591get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM skusb_2015_03_1186081100988665get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM echsz_laes174110950795955get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageright WHERE signalcode is not null and block_id='0')
                                      AS b
                                  ON a.abonent_id=b.abonent_id and a.page_id=b.page_id and a.connector_id=b.connector_id and a.connector_port_id=b.connector_port_id
                              ORDER BY a.abonent_id, a.page_id)
                                 AS q
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM f7952415767822940get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM d769305054713560get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM c2485043296429498get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM a260290338703446get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM ae613429596541854get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM b526745947807181get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM e686181878568236get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM sku_svo_laes4418715782306get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM stk_tg_nt6463275467591get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM skusb_2015_03_1186081100988665get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM echsz_laes174110950795955get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL)
                           AS c
                           INNER JOIN
                       (SELECT abonent_id, page_id, page_kks, page_no FROM f7952415767822940get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM d769305054713560get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM c2485043296429498get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM a260290338703446get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM ae613429596541854get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM b526745947807181get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM e686181878568236get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM sku_svo_laes4418715782306get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM stk_tg_nt6463275467591get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM skusb_2015_03_1186081100988665get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM echsz_laes174110950795955get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM laes_2_blok_1_echsr_k_12008591657336291get.Pages)
                           AS d
                       ON c.abonent_id=d.abonent_id and c.page_id=d.page_id)
                  AS e
                  LEFT JOIN
              (SELECT f.abonent_id, f.bst_type, f.bst_nr, f.kanal, f.page as pageleft, f.page_no as pageleft_no, f.signalcode, h.page_kks as page, h.page_no
               FROM
                   (SELECT w.abonent_id, w.bst_type, w.bst_nr, w.kanal, w.page, w.page_no, w.signalcode, w.page_id
                    FROM
                        (SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM f7952415767822940get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM d769305054713560get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM c2485043296429498get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM a260290338703446get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM ae613429596541854get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM b526745947807181get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM e686181878568236get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM sku_svo_laes4418715782306get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM stk_tg_nt6463275467591get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM skusb_2015_03_1186081100988665get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM echsz_laes174110950795955get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageleft WHERE block_id='0')
                            as w
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM f7952415767822940get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM d769305054713560get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM c2485043296429498get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM a260290338703446get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM ae613429596541854get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM b526745947807181get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM e686181878568236get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM sku_svo_laes4418715782306get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM stk_tg_nt6463275467591get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM skusb_2015_03_1186081100988665get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM echsz_laes174110950795955get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageleft WHERE telegram IS NOT NULL
                   )
                       AS f
                       INNER JOIN
                   (SELECT abonent_id, page_id, page_kks, page_no FROM f7952415767822940get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM d769305054713560get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM c2485043296429498get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM a260290338703446get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM ae613429596541854get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM b526745947807181get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM e686181878568236get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM sku_svo_laes4418715782306get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM stk_tg_nt6463275467591get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM skusb_2015_03_1186081100988665get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM echsz_laes174110950795955get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM laes_2_blok_1_echsr_k_12008591657336291get.Pages)
                       AS h
                   ON f.abonent_id=h.abonent_id and f.page_id=h.page_id)
                  AS k
              ON e.pageright=k.page AND e.signalcode=k.signalcode AND e.page=k.pageleft
         WHERE k.page IS NULL
-- AND e.pageright like '%LAB00%'
         UNION
         SELECT DISTINCT e.abonent_id AS out_abonent, e.page as out_kks, e.page_no as out_kks_no, e.signalcode as out_sigcode, e.bst_type as out_bstype, e.bst_nr as out_bstno, e.kanal as out_kanal,
                         k.abonent_id as in_abonent, k.page as in_kks, k.page_no as in_kks_no, k.signalcode as in_sigcode, 0 as out_bus_addr, NULL as out_sbstype, NULL as out_sbstno,
                         e.pageright_no, k.bst_type, k.bst_nr, k.pageleft, k.pageleft_no, e.pageright as pagerightkks, k.kanal AS in_kanal
         FROM (
                  SELECT DISTINCT c.abonent_id, d.page_kks as page, d.page_no, c.signalcode, c.bst_type, c.bst_nr, c.kanal, c.pageright, c.pageright_no, c.page_id, c.description, c.setting
                  FROM (SELECT DISTINCT q.abonent_id, q.signalcode, q.bst_type, q.bst_nr, q.kanal, q.pageright, q.pageright_no, q.page_id, q.description, q.setting
                        FROM (SELECT DISTINCT a.abonent_id, b.signalcode, a.pageright, a.pageright_no, a.bst_type, a.bst_nr, a.kanal, a.page_id, b.description, b.setting
                              FROM
                                  (SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM f7952415767822940get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM d769305054713560get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM c2485043296429498get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM a260290338703446get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM ae613429596541854get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM b526745947807181get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM e686181878568236get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM sku_svo_laes4418715782306get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM stk_tg_nt6463275467591get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM skusb_2015_03_1186081100988665get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM echsz_laes174110950795955get.Pageright WHERE block_id='0' and page<>''
                                   UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageright WHERE block_id='0' and page<>'')
                                      AS a
                                      INNER JOIN
                                  (SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM f7952415767822940get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM d769305054713560get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM c2485043296429498get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM a260290338703446get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM ae613429596541854get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM b526745947807181get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM e686181878568236get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM sku_svo_laes4418715782306get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM stk_tg_nt6463275467591get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM skusb_2015_03_1186081100988665get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM echsz_laes174110950795955get.Pageright WHERE signalcode is not null and block_id='0'
                                   UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageright WHERE signalcode is not null and block_id='0')
                                      AS b
                                  ON a.abonent_id=b.abonent_id and a.page_id=b.page_id and a.connector_id=b.connector_id and a.connector_port_id=b.connector_port_id
                              ORDER BY a.abonent_id, a.page_id)
                                 AS q
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM f7952415767822940get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM d769305054713560get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM c2485043296429498get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM a260290338703446get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM ae613429596541854get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM b526745947807181get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM e686181878568236get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM sku_svo_laes4418715782306get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM stk_tg_nt6463275467591get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM skusb_2015_03_1186081100988665get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM echsz_laes174110950795955get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                        UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL)
                           AS c
                           INNER JOIN
                       (SELECT abonent_id, page_id, page_kks, page_no FROM f7952415767822940get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM d769305054713560get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM c2485043296429498get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM a260290338703446get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM ae613429596541854get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM b526745947807181get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM e686181878568236get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM sku_svo_laes4418715782306get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM stk_tg_nt6463275467591get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM skusb_2015_03_1186081100988665get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM echsz_laes174110950795955get.Pages
                        UNION SELECT abonent_id, page_id, page_kks, page_no FROM laes_2_blok_1_echsr_k_12008591657336291get.Pages)
                           AS d
                       ON c.abonent_id=d.abonent_id and c.page_id=d.page_id)
                  AS e
                  RIGHT JOIN
              (SELECT f.abonent_id, f.bst_type, f.bst_nr, f.kanal, f.page as pageleft, f.page_no as pageleft_no, f.signalcode, h.page_kks as page, h.page_no
               FROM
                   (SELECT w.abonent_id, w.bst_type, w.bst_nr, w.kanal, w.page, w.page_no, w.signalcode, w.page_id
                    FROM
                        (SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM f7952415767822940get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM d769305054713560get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM c2485043296429498get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM a260290338703446get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM ae613429596541854get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM b526745947807181get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM e686181878568236get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM sku_svo_laes4418715782306get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM stk_tg_nt6463275467591get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM skusb_2015_03_1186081100988665get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM echsz_laes174110950795955get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageleft WHERE block_id='0')
                            as w
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM f7952415767822940get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM d769305054713560get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM c2485043296429498get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM a260290338703446get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM ae613429596541854get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM b526745947807181get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM e686181878568236get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM sku_svo_laes4418715782306get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM stk_tg_nt6463275467591get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM skusb_2015_03_1186081100988665get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM echsz_laes174110950795955get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageleft WHERE telegram IS NOT NULL
                   )
                       AS f
                       INNER JOIN
                   (SELECT abonent_id, page_id, page_kks, page_no FROM f7952415767822940get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM d769305054713560get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM c2485043296429498get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM a260290338703446get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM ae613429596541854get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM b526745947807181get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM e686181878568236get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM sku_svo_laes4418715782306get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM stk_tg_nt6463275467591get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM skusb_2015_03_1186081100988665get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM echsz_laes174110950795955get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM laes_2_blok_1_echsr_k_12008591657336291get.Pages)
                       AS h
                   ON f.abonent_id=h.abonent_id and f.page_id=h.page_id)
                  AS k
              ON e.pageright=k.page AND e.signalcode=k.signalcode AND e.page=k.pageleft
         WHERE e.page IS NULL
-- AND k.page like '%LAB00%'
         UNION
         SELECT DISTINCT e.abonent_id AS out_abonent, e.page as out_kks, e.page_no as out_kks_no, e.signalcode as out_sigcode, e.bst_type as out_bstype, e.bst_nr as out_bstno, e.kanal as out_kanal,
                         k.abonent_id as in_abonent, k.page as in_kks, k.page_no as in_kks_no, k.signalcode as in_sigcode, e.bus_addr as out_bus_addr, e.sbst_type as out_sbstype, e.sbst_nr as out_sbstno,
                         e.pageright_no, k.bst_type, k.bst_nr, k.pageleft, k.pageleft_no, e.pageright as pagerightkks, k.kanal AS in_kanal
         FROM (SELECT r.abonent_id, r.page, r.page_no, r.signalcode, r.bst_type, r.bst_nr, r.kanal, r.pageright, r.pageright_no, r.page_id, r.description, r.setting, bst.abonent_id as bus_addr, bst.bst_nr as sbst_nr, bst.bst_type as sbst_type
               FROM(SELECT DISTINCT c.abonent_id, d.page_kks as page, d.page_no, c.signalcode, c.bst_type, c.bst_nr, c.kanal, c.pageright, c.pageright_no, c.page_id, c.description, c.setting
                    FROM (SELECT DISTINCT q.abonent_id, q.signalcode, q.bst_type, q.bst_nr, q.kanal, q.pageright, q.pageright_no, q.page_id, q.description, q.setting
                          FROM (SELECT DISTINCT a.abonent_id, b.signalcode, a.pageright, a.pageright_no, a.bst_type, a.bst_nr, a.kanal, a.page_id, b.description, b.setting
                                FROM
                                    (SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM f7952415767822940get.Pageright WHERE block_id='0' and page<>''
                                     UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM d769305054713560get.Pageright WHERE block_id='0' and page<>''
                                     UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM c2485043296429498get.Pageright WHERE block_id='0' and page<>''
                                     UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM a260290338703446get.Pageright WHERE block_id='0' and page<>''
                                     UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM ae613429596541854get.Pageright WHERE block_id='0' and page<>''
                                     UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM b526745947807181get.Pageright WHERE block_id='0' and page<>''
                                     UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM e686181878568236get.Pageright WHERE block_id='0' and page<>''
                                     UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM sku_svo_laes4418715782306get.Pageright WHERE block_id='0' and page<>''
                                     UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM stk_tg_nt6463275467591get.Pageright WHERE block_id='0' and page<>''
                                     UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM skusb_2015_03_1186081100988665get.Pageright WHERE block_id='0' and page<>''
                                     UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM echsz_laes174110950795955get.Pageright WHERE block_id='0' and page<>''
                                     UNION SELECT abonent_id, page as pageright, page_no as pageright_no, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, connector_id, connector_port_id, page_id, signalcode FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageright WHERE block_id='0' and page<>'')
                                        AS a
                                        INNER JOIN
                                    (SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM f7952415767822940get.Pageright WHERE signalcode is not null and block_id='0'
                                     UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM d769305054713560get.Pageright WHERE signalcode is not null and block_id='0'
                                     UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM c2485043296429498get.Pageright WHERE signalcode is not null and block_id='0'
                                     UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM a260290338703446get.Pageright WHERE signalcode is not null and block_id='0'
                                     UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM ae613429596541854get.Pageright WHERE signalcode is not null and block_id='0'
                                     UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM b526745947807181get.Pageright WHERE signalcode is not null and block_id='0'
                                     UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM e686181878568236get.Pageright WHERE signalcode is not null and block_id='0'
                                     UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM sku_svo_laes4418715782306get.Pageright WHERE signalcode is not null and block_id='0'
                                     UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM stk_tg_nt6463275467591get.Pageright WHERE signalcode is not null and block_id='0'
                                     UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM skusb_2015_03_1186081100988665get.Pageright WHERE signalcode is not null and block_id='0'
                                     UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM echsz_laes174110950795955get.Pageright WHERE signalcode is not null and block_id='0'
                                     UNION SELECT abonent_id, page_id, connector_id, connector_port_id, signalcode, description, setting FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageright WHERE signalcode is not null and block_id='0')
                                        AS b
                                    ON a.abonent_id=b.abonent_id and a.page_id=b.page_id and a.connector_id=b.connector_id and a.connector_port_id=b.connector_port_id
                                ORDER BY a.abonent_id, a.page_id)
                                   AS q
                          UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM f7952415767822940get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                          UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM d769305054713560get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                          UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM c2485043296429498get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                          UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM a260290338703446get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                          UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM ae613429596541854get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                          UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM b526745947807181get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                          UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM e686181878568236get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                          UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM sku_svo_laes4418715782306get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                          UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM stk_tg_nt6463275467591get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                          UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM skusb_2015_03_1186081100988665get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                          UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM echsz_laes174110950795955get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL
                          UNION SELECT abonent_id, signalcode, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page as pageright, page_no as pageright_no, page_id, description, setting FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageright WHERE telegram IS NOT NULL and page IS NOT NULL and signalcode IS NOT NULL)
                             AS c
                             INNER JOIN
                         (SELECT abonent_id, page_id, page_kks, page_no FROM f7952415767822940get.Pages
                          UNION SELECT abonent_id, page_id, page_kks, page_no FROM d769305054713560get.Pages
                          UNION SELECT abonent_id, page_id, page_kks, page_no FROM c2485043296429498get.Pages
                          UNION SELECT abonent_id, page_id, page_kks, page_no FROM a260290338703446get.Pages
                          UNION SELECT abonent_id, page_id, page_kks, page_no FROM ae613429596541854get.Pages
                          UNION SELECT abonent_id, page_id, page_kks, page_no FROM b526745947807181get.Pages
                          UNION SELECT abonent_id, page_id, page_kks, page_no FROM e686181878568236get.Pages
                          UNION SELECT abonent_id, page_id, page_kks, page_no FROM sku_svo_laes4418715782306get.Pages
                          UNION SELECT abonent_id, page_id, page_kks, page_no FROM stk_tg_nt6463275467591get.Pages
                          UNION SELECT abonent_id, page_id, page_kks, page_no FROM skusb_2015_03_1186081100988665get.Pages
                          UNION SELECT abonent_id, page_id, page_kks, page_no FROM echsz_laes174110950795955get.Pages
                          UNION SELECT abonent_id, page_id, page_kks, page_no FROM laes_2_blok_1_echsr_k_12008591657336291get.Pages)
                             AS d
                         ON c.abonent_id=d.abonent_id and c.page_id=d.page_id)
                       AS r LEFT JOIN
                   (SELECT abonent_id, bus_addr::INTEGER, sbst_nr::VARCHAR, sbst_type, bst_type, bst_nr::VARCHAR FROM f7952415767822940get.bst
                    UNION SELECT abonent_id, bus_addr::INTEGER, sbst_nr::VARCHAR, sbst_type, bst_type, bst_nr::VARCHAR FROM d769305054713560get.bst
                    UNION SELECT abonent_id, bus_addr::INTEGER, sbst_nr::VARCHAR, sbst_type, bst_type, bst_nr::VARCHAR FROM c2485043296429498get.bst
                    UNION SELECT abonent_id, bus_addr::INTEGER, sbst_nr::VARCHAR, sbst_type, bst_type, bst_nr::VARCHAR FROM a260290338703446get.bst
                    UNION SELECT abonent_id, bus_addr::INTEGER, sbst_nr::VARCHAR, sbst_type, bst_type, bst_nr::VARCHAR FROM ae613429596541854get.bst
                    UNION SELECT abonent_id, bus_addr::INTEGER, sbst_nr::VARCHAR, sbst_type, bst_type, bst_nr::VARCHAR FROM b526745947807181get.bst
                    UNION SELECT abonent_id, bus_addr::INTEGER, sbst_nr::VARCHAR, sbst_type, bst_type, bst_nr::VARCHAR FROM e686181878568236get.bst
                    UNION SELECT abonent_id, bus_addr::INTEGER, sbst_nr::VARCHAR, sbst_type, bst_type, bst_nr::VARCHAR FROM sku_svo_laes4418715782306get.bst
                    UNION SELECT abonent_id, bus_addr::INTEGER, sbst_nr::VARCHAR, sbst_type, bst_type, bst_nr::VARCHAR FROM stk_tg_nt6463275467591get.bst
                    UNION SELECT abonent_id, bus_addr::INTEGER, sbst_nr::VARCHAR, sbst_type, bst_type, bst_nr::VARCHAR FROM skusb_2015_03_1186081100988665get.bst
                    UNION SELECT abonent_id, bus_addr::INTEGER, sbst_nr::VARCHAR, sbst_type, bst_type, bst_nr::VARCHAR FROM echsz_laes174110950795955get.bst
                    UNION SELECT abonent_id, bus_addr::INTEGER, sbst_nr::VARCHAR, sbst_type, bst_type, bst_nr::VARCHAR FROM laes_2_blok_1_echsr_k_12008591657336291get.bst)
                       AS bst
                   ON (r.abonent_id=bst.bus_addr) AND (r.bst_nr = bst.sbst_nr) AND (r.bst_type = bst.sbst_type)
              )
                  AS e
                  RIGHT JOIN
              (SELECT f.abonent_id, f.bst_type, f.bst_nr, f.kanal, f.page as pageleft, f.page_no as pageleft_no, f.signalcode, h.page_kks as page, h.page_no
               FROM
                   (SELECT w.abonent_id, w.bst_type, w.bst_nr, w.kanal, w.page, w.page_no, w.signalcode, w.page_id
                    FROM
                        (SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM f7952415767822940get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM d769305054713560get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM c2485043296429498get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM a260290338703446get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM ae613429596541854get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM b526745947807181get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM e686181878568236get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM sku_svo_laes4418715782306get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM stk_tg_nt6463275467591get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM skusb_2015_03_1186081100988665get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM echsz_laes174110950795955get.Pageleft WHERE block_id='0'
                         UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageleft WHERE block_id='0')
                            as w
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM f7952415767822940get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM d769305054713560get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM c2485043296429498get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM a260290338703446get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM ae613429596541854get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM b526745947807181get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM e686181878568236get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM sku_svo_laes4418715782306get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM stk_tg_nt6463275467591get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM skusb_2015_03_1186081100988665get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM echsz_laes174110950795955get.Pageleft WHERE telegram IS NOT NULL
                    UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3) as bst_nr, kanal, page, page_no, signalcode, page_id FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageleft WHERE telegram IS NOT NULL
                   )
                       AS f
                       INNER JOIN
                   (SELECT abonent_id, page_id, page_kks, page_no FROM f7952415767822940get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM d769305054713560get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM c2485043296429498get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM a260290338703446get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM ae613429596541854get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM b526745947807181get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM e686181878568236get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM sku_svo_laes4418715782306get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM stk_tg_nt6463275467591get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM skusb_2015_03_1186081100988665get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM echsz_laes174110950795955get.Pages
                    UNION SELECT abonent_id, page_id, page_kks, page_no FROM laes_2_blok_1_echsr_k_12008591657336291get.Pages)
                       AS h
                   ON f.abonent_id=h.abonent_id and f.page_id=h.page_id)
                  AS k
              ON e.pageright=k.page AND e.signalcode=k.signalcode AND e.page=k.pageleft
         where (e.bus_addr IS NULL and e.bst_nr IS NOT NULL) or (e.bus_addr<>k.abonent_id) or (e.kanal<>k.kanal) or (e.sbst_nr<>k.bst_nr)) AS foo;