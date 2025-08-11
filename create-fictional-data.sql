-- Script para criar dados fictícios no banco PostgreSQL externo
-- Primeiro limpar logs existentes
DELETE FROM access_logs;

-- Inserir dados fictícios de logs para os últimos 14 dias
DO $$
DECLARE
    device_ids VARCHAR[] := ARRAY(SELECT id FROM devices LIMIT 5);
    actions VARCHAR[] := ARRAY['Entrada', 'Saída'];
    log_date DATE;
    logs_per_day INTEGER;
    i INTEGER;
    j INTEGER;
    random_device VARCHAR;
    random_action VARCHAR;
    random_hour INTEGER;
    random_minute INTEGER;
    log_timestamp TIMESTAMP;
BEGIN
    -- Gerar dados para os últimos 14 dias
    FOR i IN 0..13 LOOP
        log_date := CURRENT_DATE - i;
        
        -- Mais logs em dias úteis (segunda=1 a sexta=5)
        IF EXTRACT(DOW FROM log_date) BETWEEN 1 AND 5 THEN
            logs_per_day := 80 + (RANDOM() * 100)::INTEGER; -- 80-180 logs
        ELSE
            logs_per_day := 30 + (RANDOM() * 50)::INTEGER;  -- 30-80 logs
        END IF;
        
        -- Criar logs para o dia
        FOR j IN 1..logs_per_day LOOP
            random_device := device_ids[1 + (RANDOM() * array_length(device_ids, 1))::INTEGER];
            random_action := actions[1 + (RANDOM() * 2)::INTEGER];
            
            -- Horário comercial (8h às 20h)
            random_hour := 8 + (RANDOM() * 12)::INTEGER;
            random_minute := (RANDOM() * 60)::INTEGER;
            
            log_timestamp := log_date + (random_hour || ' hours ' || random_minute || ' minutes')::INTERVAL + (RANDOM() * 60)::INTEGER * INTERVAL '1 second';
            
            INSERT INTO access_logs (device_id, action, timestamp)
            VALUES (random_device, random_action, log_timestamp);
        END LOOP;
        
        RAISE NOTICE 'Criados % logs para %', logs_per_day, log_date;
    END LOOP;
    
    RAISE NOTICE 'Dados fictícios criados com sucesso!';
END $$;

-- Verificar quantidade de logs criados
SELECT COUNT(*) as total_logs FROM access_logs;
SELECT DATE(timestamp) as data, COUNT(*) as logs_por_dia 
FROM access_logs 
GROUP BY DATE(timestamp) 
ORDER BY data DESC 
LIMIT 14;