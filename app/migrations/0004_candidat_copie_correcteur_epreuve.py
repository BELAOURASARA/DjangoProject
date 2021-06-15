# Generated by Django 3.2.3 on 2021-06-13 23:59

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0003_type'),
    ]

    operations = [
        migrations.CreateModel(
            name='Candidat',
            fields=[
                ('matricule', models.BigAutoField(primary_key=True, serialize=False)),
                ('nom', models.CharField(max_length=100)),
                ('prenom', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Correcteur',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('specialité', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Epreuve',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('titre', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Copie',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.CharField(max_length=100)),
                ('note', models.IntegerField()),
                ('isvalidated', models.BooleanField()),
                ('idcorrecteur', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.correcteur')),
                ('idepreuve', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.epreuve')),
                ('matricule', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.candidat')),
            ],
        ),
    ]
