import { TestBed } from '@angular/core/testing';
import { SawoComponent } from './sawo.component';

describe('SawoComponent', () => {
  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [
        SawoComponent
      ],
    }).compileComponents();
  });

  it('should create the app', () => {
    const fixture = TestBed.createComponent(SawoComponent);
    const app = fixture.componentInstance;
    expect(app).toBeTruthy();
  });

  it(`should have as title 'angular-sawo'`, () => {
    const fixture = TestBed.createComponent(SawoComponent);
    const app = fixture.componentInstance;
    expect(app.title).toEqual('angular-sawo');
  });

  it('should render title', () => {
    const fixture = TestBed.createComponent(SawoComponent);
    fixture.detectChanges();
    const compiled = fixture.nativeElement;
    expect(compiled.querySelector('.content span').textContent).toContain('angular-sawo app is running!');
  });
});
