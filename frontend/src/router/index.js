import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '@/views/home/HomeView.vue'
import AboutView from '@/views/about/AboutView.vue'
import LoginView from '@/views/login/LoginView.vue'
import RegisterView from '@/views/register/RegisterView.vue'
import PanelView from '@/views/panel/PanelView.vue'
import ArticleView from '@/views/article/ArticleView.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/about',
    name: 'about',
    component: AboutView
  },
  {
    path: '/login',
    name: 'login',
    component: LoginView
  },
  {
    path: '/register',
    name: 'register',
    component: RegisterView
  },
  {
    path: '/panel',
    name: 'panel',
    component: PanelView
  },
  {
    path: '/article/:id',
    name: 'article',
    component: ArticleView
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
