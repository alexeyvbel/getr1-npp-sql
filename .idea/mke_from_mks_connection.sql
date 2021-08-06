SELECT mksTab.*, bst.bus_addr AS part_abonent_id, bst.sbst_type, bst.sbst_nr
FROM (SELECT abonent_id, bst_type, bst_nr, (32 - count(bst_nr)) AS lastCount
      FROM (SELECT abonent_id, bst_type, bst_nr, kanal FROM (SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM f7952415767822940get.Pageleft
                                                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM d769305054713560get.Pageleft
                                                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM c2485043296429498get.Pageleft
                                                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM a260290338703446get.Pageleft
                                                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM ae613429596541854get.Pageleft
                                                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM b526745947807181get.Pageleft
                                                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM e686181878568236get.Pageleft
                                                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM sku_svo_laes4418715782306get.Pageleft
                                                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM stk_tg_nt6463275467591get.Pageleft
                                                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM skusb_2015_03_1186081100988665get.Pageleft
                                                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM echsz_laes174110950795955get.Pageleft
                                                             UNION SELECT abonent_id, left(telegram,3) as bst_type, right(telegram,length(telegram)-3)::integer as bst_nr, kanal FROM laes_2_blok_1_echsr_k_12008591657336291get.Pageleft) AS Tabqrel
            WHERE bst_type = 'MKE' GROUP BY abonent_id, bst_type, bst_nr, kanal) AS t_temp
      GROUP BY abonent_id, bst_type, bst_nr)  AS mksTab LEFT JOIN (SELECT abonent_id, bus_addr, sbst_nr, sbst_type, bst_type, bst_nr FROM f7952415767822940get.bst
                                                                   UNION SELECT abonent_id, bus_addr, sbst_nr, sbst_type, bst_type, bst_nr FROM d769305054713560get.bst
                                                                   UNION SELECT abonent_id, bus_addr, sbst_nr, sbst_type, bst_type, bst_nr FROM c2485043296429498get.bst
                                                                   UNION SELECT abonent_id, bus_addr, sbst_nr, sbst_type, bst_type, bst_nr FROM a260290338703446get.bst
                                                                   UNION SELECT abonent_id, bus_addr, sbst_nr, sbst_type, bst_type, bst_nr FROM ae613429596541854get.bst
                                                                   UNION SELECT abonent_id, bus_addr, sbst_nr, sbst_type, bst_type, bst_nr FROM b526745947807181get.bst
                                                                   UNION SELECT abonent_id, bus_addr, sbst_nr, sbst_type, bst_type, bst_nr FROM e686181878568236get.bst
                                                                   UNION SELECT abonent_id, bus_addr, sbst_nr, sbst_type, bst_type, bst_nr FROM sku_svo_laes4418715782306get.bst
                                                                   UNION SELECT abonent_id, bus_addr, sbst_nr, sbst_type, bst_type, bst_nr FROM stk_tg_nt6463275467591get.bst
                                                                   UNION SELECT abonent_id, bus_addr, sbst_nr, sbst_type, bst_type, bst_nr FROM skusb_2015_03_1186081100988665get.bst
                                                                   UNION SELECT abonent_id, bus_addr, sbst_nr, sbst_type, bst_type, bst_nr FROM echsz_laes174110950795955get.bst
                                                                   UNION SELECT abonent_id, bus_addr, sbst_nr, sbst_type, bst_type, bst_nr FROM laes_2_blok_1_echsr_k_12008591657336291get.bst) AS bst
                                                                  ON (mksTab.abonent_id=bst.abonent_id) AND (mksTab.bst_nr = bst.bst_nr) AND (mksTab.bst_type = bst.bst_type)
WHERE mksTab.abonent_id = '614' AND bst.abonent_id IS NOT NULL
ORDER BY mksTab.bst_nr
