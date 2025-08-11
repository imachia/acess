# Sistema de Controle de Acesso SaaS

Um sistema completo de controle de acesso com interface moderna e integração com PostgreSQL externo.

## 🚀 Características

- **Interface Moderna**: Design sem bordas com gradientes e componentes em estilo bullet
- **PostgreSQL Externo**: Conecta diretamente ao banco de dados externo (500+ logs reais)
- **Dashboard Real**: KPIs e métricas baseadas em dados autênticos do banco
- **Zero Mock Data**: Todos os dados vêm exclusivamente do PostgreSQL
- **Design Responsivo**: Interface adaptável para desktop e mobile
- **Health Checks**: Monitoramento automático da aplicação

## 🛠️ Tecnologias

- **Frontend**: React 18 + TypeScript + Vite
- **Backend**: Express.js + Node.js
- **Banco**: PostgreSQL externo
- **UI**: TailwindCSS + Shadcn/ui
- **Deploy**: Docker + Portainer ready

## 📊 Dados do Sistema

- **500+ logs de acesso** reais
- **3 lojas** configuradas
- **5 dispositivos** ativos  
- **10 clientes** registrados
- **Alertas de segurança** funcionais

## 🔧 Deploy Local

```bash
# Instalar dependências
npm install

# Executar em desenvolvimento
npm run dev

# Build para produção
npm run build

# Executar produção
npm start
```

## 🐳 Deploy com Docker

```bash
# Build da imagem
docker build -t access-control-saas .

# Executar container
docker run -p 5000:5000 access-control-saas
```

## 📋 Deploy no Portainer

1. Use o arquivo `portainer-completo.yml`
2. Método "Web Editor" no Portainer
3. Cole o conteúdo do arquivo YAML
4. Deploy automático

## 🔍 Endpoints

- **Dashboard**: `http://localhost:5000`
- **Health Check**: `http://localhost:5000/api/health`
- **Access Logs**: `http://localhost:5000/api/access-logs`
- **Stores**: `http://localhost:5000/api/stores`
- **Devices**: `http://localhost:5000/api/devices`
- **Clients**: `http://localhost:5000/api/clients`

## 📈 Dashboard Features

- Estatísticas em tempo real
- Lista de eventos recentes
- Interface sem bordas
- Design com gradientes
- Dados autênticos do PostgreSQL

## ⚙️ Configuração

As variáveis de ambiente necessárias estão no arquivo `production.env`:

- DATABASE_URL
- PGHOST, PGPORT, PGUSER, PGPASSWORD, PGDATABASE
- S3_ACCESS_KEY, S3_SECRET_KEY, S3_BUCKET, S3_ENDPOINT

## 🎯 Status do Projeto

✅ Conexão PostgreSQL externa funcionando  
✅ 500+ logs reais carregados  
✅ Interface sem bordas implementada  
✅ Dashboard com KPIs autênticos  
✅ Build de produção otimizado  
✅ Deploy via Docker/Portainer  
✅ Health checks automáticos  

## 📝 Licença

MIT License - Veja o arquivo LICENSE para detalhes.