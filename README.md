# E-commerce Robot Framework Tests

![Robot Framework](https://img.shields.io/badge/Robot_Framework-7.3.2-blue)
![Python](https://img.shields.io/badge/Python-3.12-yellow)
![Status](https://img.shields.io/badge/Status-Em%20desenvolvimento-orange)

Automação de testes para [Sauce Demo](https://www.saucedemo.com/) usando **Robot Framework** e **SeleniumLibrary**.

---

## Estrutura do Projeto

- `tests/` — Testes Robot Framework  
  - `login_tests.robot`  
  - `products_tests.robot`  
- `resources/` — Locators e Keywords  
  - `locators.robot`  
  - `keywords.robot`  
- `venv/` — Ambiente virtual Python  
- `reports/` — Evidências e screenshots  
- `README.md` — Este arquivo  

---

## Testes Implementados

### Login
- Usuário válido
- Senha inválida

### Produtos
- Verificar lista de produtos (nome, preço, imagem)
- Testar filtragem de produtos (Price low to high)

---

## Configuração & Execução

1. Ativar o ambiente virtual:

```powershell
.env\Scripts\Activate.ps1
```

2. Executar os testes:

```powershell
robot --listener allure_robotframework tests
```

3. Gerar relatório Allure:

```powershell
allure serve output/allure
```

---

## Credenciais de Teste

**Usuários válidos:**  
standard_user, locked_out_user, problem_user, performance_glitch_user, error_user, visual_user

**Senha para todos:** secret_sauce

---

## Observações

- Recomendado usar Chrome compatível com o WebDriver.
- O projeto utiliza Robot Framework 7.3.2 e Python 3.12.
