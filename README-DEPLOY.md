# Deploy no Portainer - Sistema de Controle de Acesso

## 🚀 Instruções de Deploy

### 1. Arquivos Necessários
- `Dockerfile` - Configuração do container
- `docker-compose.yml` - Orquestração do serviço
- `production.env` - Variáveis de ambiente
- `dist/` - Build de produção (gerado com `npm run build`)

### 2. Deploy no Portainer

#### Opção A: Docker Compose via Stack
1. No Portainer, vá em **Stacks** > **Add stack**
2. Nome da stack: `access-control-saas`
3. Copie o conteúdo do arquivo `docker-compose.yml`
4. Configure as variáveis de ambiente:
   - `DATABASE_URL=postgresql://postgres:929d54bc0ff22387163f04cfb3b3d0fa@148.230.78.128:5432/controle`
   - `PGHOST=148.230.78.128`
   - `PGPORT=5432`
   - `PGUSER=postgres`
   - `PGPASSWORD=929d54bc0ff22387163f04cfb3b3d0fa`
   - `PGDATABASE=controle`
   - `S3_ACCESS_KEY=kEtCCAq0EAaQHJtPg8Mh`
   - `S3_SECRET_KEY=tBQT17iRlqvJEYWXuIcS7Wl3g1jXsJreI31k2aTC`
   - `S3_BUCKET=primus`
   - `S3_ENDPOINT=s3.deliwise.com.br`
5. Click **Deploy the stack**

#### Opção B: Build de Imagem Docker
```bash
# 1. Build da imagem
docker build -t access-control-saas:latest .

# 2. Tag para registry (se necessário)
docker tag access-control-saas:latest seu-registry/access-control-saas:latest

# 3. Push para registry
docker push seu-registry/access-control-saas:latest
```

### 3. Configurações Importantes

#### Portas
- **Aplicação**: 5000 (mapeada externamente)
- **Health Check**: `/api/health`

#### Banco de Dados
- **Host Externo**: 148.230.78.128:5432
- **Database**: controle
- **Contém**: 500 logs, 3 lojas, 5 dispositivos, 10 clientes, 5 alertas

#### Storage MinIO
- **Endpoint**: s3.deliwise.com.br
- **Bucket**: primus
- **Funcionalidade**: Upload de logos do sistema

### 4. Verificação do Deploy

#### Health Check
```bash
curl http://localhost:5000/api/health
```

Resposta esperada:
```json
{
  "status": "ok",
  "database": "connected",
  "timestamp": "2025-08-11T..."
}
```

#### Endpoints Principais
- `/` - Interface principal do sistema
- `/api/access-logs` - 500 logs de acesso (sem cache)
- `/api/stores` - 3 lojas configuradas
- `/api/devices` - 5 dispositivos ativos
- `/api/clients` - 10 clientes registrados
- `/api/alerts` - 5 alertas do sistema

### 5. Monitoramento

#### Logs do Container
```bash
docker logs access-control-saas -f
```

#### Métricas Importantes
- **CPU**: < 50% em operação normal
- **Memória**: ~512MB para operação otimizada
- **Disco**: ~200MB (build otimizado)
- **Conexões**: PostgreSQL pool de conexões ativo

### 6. Recursos da Aplicação

#### Dashboard Real
- KPIs calculados dos 500 logs reais
- Gráficos de acesso por semana
- Eventos recentes com clientes e fotos

#### Funcionalidades
- ✅ Controle de acesso completo
- ✅ Gerenciamento de lojas e dispositivos
- ✅ Logs de acesso em tempo real
- ✅ Alertas de segurança
- ✅ Configurações do sistema
- ✅ Upload de logos (MinIO)
- ✅ Interface responsiva sem bordas

#### Banco de Dados
- ✅ PostgreSQL externo conectado
- ✅ 500 logs fictícios com clientes reais
- ✅ Zero "Acesso não identificado"
- ✅ Dados autênticos em toda aplicação

### 7. Troubleshooting

#### Problema: Container não inicia
```bash
# Verificar logs
docker logs access-control-saas

# Verificar variáveis de ambiente
docker inspect access-control-saas
```

#### Problema: Banco não conecta
- Verificar se HOST 148.230.78.128 está acessível
- Confirmar credenciais do PostgreSQL
- Verificar firewall e rede

#### Problema: MinIO não funciona
- Verificar credenciais S3
- Testar endpoint s3.deliwise.com.br
- Verificar permissões do bucket

---

## 🎯 Build Otimizado para Produção

### Características do Build
- **Vite Build**: Frontend otimizado e minificado
- **ESBuild**: Backend compilado para ESM
- **Multi-stage Docker**: Build otimizado em camadas
- **Health Checks**: Monitoramento automático
- **Non-root User**: Segurança aprimorada
- **Production Mode**: Todas as otimizações ativas

### Tamanho Final
- **Frontend**: ~1MB (comprimido)
- **Backend**: ~62KB (compilado)
- **Imagem Docker**: ~200MB (Alpine Linux)
- **Runtime**: Node.js 18 LTS