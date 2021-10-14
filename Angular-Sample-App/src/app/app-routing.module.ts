// import { Routes, RouterModule } from '@angular/router';

// import { HomeComponent } from './home/home.component';
// import { SawoComponent } from './sawo/sawo.component';

// const routes: Routes = [
//     { path: '', component: HomeComponent },
//     { path: 'sawo', component: SawoComponent},

//     // otherwise redirect to home
//     { path: '**', redirectTo: '' },
// ];

// export const appRoutingModule = RouterModule.forRoot(routes);

import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';

import { HomeComponent } from './home/home.component';
import { SawoComponent } from './sawo/sawo.component';

const appRoutes: Routes = [
    { path: '', component: HomeComponent },
    { path: 'sawo', component: SawoComponent},

    // otherwise redirect to home
    { path: '**', redirectTo: '' }
];

@NgModule({
  imports: [
    RouterModule.forRoot(
      appRoutes,
      { enableTracing: true } // <-- debugging purposes only
    )
  ],
  exports: [
    RouterModule
  ]
})
export class appRoutingModule {}