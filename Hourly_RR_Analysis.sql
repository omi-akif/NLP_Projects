SELECT SUBSTR(chat_time, 1, 2) chat_hour, 
       COUNT(DISTINCT D1) '2022-10-01',
       COUNT(DISTINCT D2) '2022-10-02',
       COUNT(DISTINCT D3) '2022-10-03',
       COUNT(DISTINCT D4) '2022-10-04',
       COUNT(DISTINCT D5) '2022-10-05',
       COUNT(DISTINCT D6) '2022-10-06',
       COUNT(DISTINCT D7) '2022-10-07',
       COUNT(DISTINCT D8) '2022-10-08' 

FROM(

   SELECT chat_time,

        CASE WHEN date_id = '2022-10-01' THEN session_id END D1,
        CASE WHEN date_id = '2022-10-02' THEN session_id END D2,
        CASE WHEN date_id = '2022-10-03' THEN session_id END D3,
        CASE WHEN date_id = '2022-10-04' THEN session_id END D4,
        CASE WHEN date_id = '2022-10-05' THEN session_id END D5,
        CASE WHEN date_id = '2022-10-06' THEN session_id END D6,
        CASE WHEN date_id = '2022-10-07' THEN session_id END D7,
        CASE WHEN date_id = '2022-10-08' THEN session_id END D8

    FROM(
        
        SELECT date_id,
        session_id,
        SUBSTR(gmt_create, 12, 19) AS chat_time,
        is_session_direct_to_agent,
        is_session_unsatisfied,
        is_session_intention_to_agent,
        is_session_last_chat_no_answer,
        is_session_click_to_agent,
        is_session_switch_to_agent,
        is_session_last_chat_recommend_not_clk

        FROM daraz_chatbot_chat_and_session_details_table

        WHERE tenant_name_new = 'Alime-DRZ-CC-BD'

    ) AS t 

      WHERE date_id >= '2022-10-01' AND date_id <= '2022-10-08'

      AND is_session_unsatisfied = 'N'
      AND is_session_direct_agent = 'N'
      AND is_session_intention_to_agent = 'N'
      AND is_session_last_chat_no_answer = 'N'
      AND is_session_click_to_agent = 'N'
      AND is_session_switch_to_agent = 'N'
      AND is_session_last_chat_recommend_not_clk ='N'
      
      
      GROUP BY chat_time

) AS t2 GROUP BY chat_hour
