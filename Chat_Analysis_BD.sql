--odps sql 
--********************************************************************--
--author:Razzak, Khandaker
--create time:2022-10-27 12:45:55
--********************************************************************--

--//-------------------------Hour-Chat-Data-----------------------------

SELECT date_id AS "date", COUNT(DISTINCT session_id) AS "Total Sessions"

FROM(

--//-------------------------Temporary Table----------------------------

    SELECT  date_id,
            session_id,
            SUBSTR(local_gmt_create,12,19) AS chat_time,
            local_gmt_create, 
            is_session_direct_agent,
            is_session_unsatisfied, 
            is_session_intention_to_agent,
            is_session_last_chat_no_answer,
            is_session_click_to_agent,
            is_session_switch_to_agent,
            is_session_last_chat_recommend_not_clk

    FROM daraz_chatbot_chat_and_session_details_table
    WHERE tenant_name_new = 'Alime-DRZ-CC-BD'
)
WHERE date_id >= '2022-09-01' AND date_id <= '2022-10-26'
        
        --//Time ------------------
        AND chat_time >= '18:00:00'
        AND chat_time <= '21:00:00'
        --//-----------------------

        -- Resolve Sessions 
        -- AND is_session_direct_agent = "Y"
        -- AND is_session_unsatisfied = 'N'
        -- AND is_session_intention_to_agent = 'N'
        -- AND is_session_last_chat_no_answer = 'N'
        -- AND is_session_click_to_agent = 'N'
        -- AND is_session_switch_to_agent = 'Y'
        -- AND is_session_last_chat_recommend_not_clk ='N'

GROUP BY date_id ORDER BY date_id;