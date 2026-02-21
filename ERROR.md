2026-02-21T06:32:02.0641216Z Current runner version: '2.331.0'
2026-02-21T06:32:02.0665769Z ##[group]Runner Image Provisioner
2026-02-21T06:32:02.0666825Z Hosted Compute Agent
2026-02-21T06:32:02.0667535Z Version: 20260123.484
2026-02-21T06:32:02.0668274Z Commit: 6bd6555ca37d84114959e1c76d2c01448ff61c5d
2026-02-21T06:32:02.0669115Z Build Date: 2026-01-23T19:41:17Z
2026-02-21T06:32:02.0669894Z Worker ID: {8ff68ab2-fdfa-4cc3-bcbb-fb33393b923a}
2026-02-21T06:32:02.0670679Z Azure Region: westus
2026-02-21T06:32:02.0671296Z ##[endgroup]
2026-02-21T06:32:02.0672844Z ##[group]Operating System
2026-02-21T06:32:02.0673568Z Ubuntu
2026-02-21T06:32:02.0674226Z 24.04.3
2026-02-21T06:32:02.0674830Z LTS
2026-02-21T06:32:02.0675927Z ##[endgroup]
2026-02-21T06:32:02.0676536Z ##[group]Runner Image
2026-02-21T06:32:02.0677189Z Image: ubuntu-24.04
2026-02-21T06:32:02.0677869Z Version: 20260201.15.1
2026-02-21T06:32:02.0679452Z Included Software: https://github.com/actions/runner-images/blob/ubuntu24/20260201.15/images/ubuntu/Ubuntu2404-Readme.md
2026-02-21T06:32:02.0681129Z Image Release: https://github.com/actions/runner-images/releases/tag/ubuntu24%2F20260201.15
2026-02-21T06:32:02.0682178Z ##[endgroup]
2026-02-21T06:32:02.0683458Z ##[group]GITHUB*TOKEN Permissions
2026-02-21T06:32:02.0685790Z Contents: read
2026-02-21T06:32:02.0686435Z Metadata: read
2026-02-21T06:32:02.0687095Z Packages: read
2026-02-21T06:32:02.0687699Z ##[endgroup]
2026-02-21T06:32:02.0689992Z Secret source: Actions
2026-02-21T06:32:02.0690906Z Prepare workflow directory
2026-02-21T06:32:02.1014393Z Prepare all required actions
2026-02-21T06:32:02.1052827Z Getting action download info
2026-02-21T06:32:02.5435989Z Download action repository 'actions/checkout@v3' (SHA:f43a0e5ff2bd294095638e18286ca9a3d1956744)
2026-02-21T06:32:02.6682105Z Download action repository 'appleboy/ssh-action@master' (SHA:0ff4204d59e8e51228ff73bce53f80d53301dee2)
2026-02-21T06:32:03.3555624Z Complete job name: Deploy
2026-02-21T06:32:03.4244459Z ##[group]Run actions/checkout@v3
2026-02-21T06:32:03.4245748Z with:
2026-02-21T06:32:03.4246344Z repository: Hytale-Paotheon/Paotheon
2026-02-21T06:32:03.4247109Z token: ***
2026-02-21T06:32:03.4247554Z ssh-strict: true
2026-02-21T06:32:03.4248032Z persist-credentials: true
2026-02-21T06:32:03.4248547Z clean: true
2026-02-21T06:32:03.4249016Z sparse-checkout-cone-mode: true
2026-02-21T06:32:03.4249558Z fetch-depth: 1
2026-02-21T06:32:03.4250012Z fetch-tags: false
2026-02-21T06:32:03.4250467Z lfs: false
2026-02-21T06:32:03.4250897Z submodules: false
2026-02-21T06:32:03.4251364Z set-safe-directory: true
2026-02-21T06:32:03.4252147Z ##[endgroup]
2026-02-21T06:32:03.5108680Z Syncing repository: Hytale-Paotheon/Paotheon
2026-02-21T06:32:03.5110791Z ##[group]Getting Git version info
2026-02-21T06:32:03.5111558Z Working directory is '/home/runner/work/Paotheon/Paotheon'
2026-02-21T06:32:03.5112660Z [command]/usr/bin/git version
2026-02-21T06:32:03.5181913Z git version 2.52.0
2026-02-21T06:32:03.5208901Z ##[endgroup]
2026-02-21T06:32:03.5223251Z Temporarily overriding HOME='/home/runner/work/\_temp/1492bacd-a86a-4efd-b6e4-d8e6f2f3fc0a' before making global git config changes
2026-02-21T06:32:03.5224840Z Adding repository directory to the temporary git global config as a safe directory
2026-02-21T06:32:03.5227026Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/Paotheon/Paotheon
2026-02-21T06:32:03.5262687Z Deleting the contents of '/home/runner/work/Paotheon/Paotheon'
2026-02-21T06:32:03.5266781Z ##[group]Initializing the repository
2026-02-21T06:32:03.5269372Z [command]/usr/bin/git init /home/runner/work/Paotheon/Paotheon
2026-02-21T06:32:03.5370505Z hint: Using 'master' as the name for the initial branch. This default branch name
2026-02-21T06:32:03.5371955Z hint: will change to "main" in Git 3.0. To configure the initial branch name
2026-02-21T06:32:03.5373280Z hint: to use in all of your new repositories, which will suppress this warning,
2026-02-21T06:32:03.5374650Z hint: call:
2026-02-21T06:32:03.5375676Z hint:
2026-02-21T06:32:03.5376660Z hint: git config --global init.defaultBranch <name>
2026-02-21T06:32:03.5377526Z hint:
2026-02-21T06:32:03.5378490Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2026-02-21T06:32:03.5380043Z hint: 'development'. The just-created branch can be renamed via this command:
2026-02-21T06:32:03.5381166Z hint:
2026-02-21T06:32:03.5381739Z hint: git branch -m <name>
2026-02-21T06:32:03.5382237Z hint:
2026-02-21T06:32:03.5382936Z hint: Disable this message with "git config set advice.defaultBranchName false"
2026-02-21T06:32:03.5384135Z Initialized empty Git repository in /home/runner/work/Paotheon/Paotheon/.git/
2026-02-21T06:32:03.5386251Z [command]/usr/bin/git remote add origin https://github.com/Hytale-Paotheon/Paotheon
2026-02-21T06:32:03.5417317Z ##[endgroup]
2026-02-21T06:32:03.5418104Z ##[group]Disabling automatic garbage collection
2026-02-21T06:32:03.5420090Z [command]/usr/bin/git config --local gc.auto 0
2026-02-21T06:32:03.5445770Z ##[endgroup]
2026-02-21T06:32:03.5446563Z ##[group]Setting up auth
2026-02-21T06:32:03.5450803Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2026-02-21T06:32:03.5476715Z [command]/usr/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
2026-02-21T06:32:03.5806028Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2026-02-21T06:32:03.5832900Z [command]/usr/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
2026-02-21T06:32:03.6048297Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2026-02-21T06:32:03.6079377Z ##[endgroup]
2026-02-21T06:32:03.6080646Z ##[group]Fetching the repository
2026-02-21T06:32:03.6087703Z [command]/usr/bin/git -c protocol.version=2 fetch --no-tags --prune --progress --no-recurse-submodules --depth=1 origin +df4bb00d9b752e050392062032e25e18e40f8787:refs/remotes/origin/main
2026-02-21T06:32:03.9479677Z remote: Enumerating objects: 111, done.  
2026-02-21T06:32:03.9481475Z remote: Counting objects: 0% (1/111)  
2026-02-21T06:32:03.9483294Z remote: Counting objects: 1% (2/111)  
2026-02-21T06:32:03.9484392Z remote: Counting objects: 2% (3/111)  
2026-02-21T06:32:03.9486018Z remote: Counting objects: 3% (4/111)  
2026-02-21T06:32:03.9487823Z remote: Counting objects: 4% (5/111)  
2026-02-21T06:32:03.9489583Z remote: Counting objects: 5% (6/111)  
2026-02-21T06:32:03.9491073Z remote: Counting objects: 6% (7/111)  
2026-02-21T06:32:03.9492102Z remote: Counting objects: 7% (8/111)  
2026-02-21T06:32:03.9493017Z remote: Counting objects: 8% (9/111)  
2026-02-21T06:32:03.9494021Z remote: Counting objects: 9% (10/111)  
2026-02-21T06:32:03.9494945Z remote: Counting objects: 10% (12/111)  
2026-02-21T06:32:03.9496123Z remote: Counting objects: 11% (13/111)  
2026-02-21T06:32:03.9497067Z remote: Counting objects: 12% (14/111)  
2026-02-21T06:32:03.9498033Z remote: Counting objects: 13% (15/111)  
2026-02-21T06:32:03.9499026Z remote: Counting objects: 14% (16/111)  
2026-02-21T06:32:03.9500030Z remote: Counting objects: 15% (17/111)  
2026-02-21T06:32:03.9500973Z remote: Counting objects: 16% (18/111)  
2026-02-21T06:32:03.9501925Z remote: Counting objects: 17% (19/111)  
2026-02-21T06:32:03.9502857Z remote: Counting objects: 18% (20/111)  
2026-02-21T06:32:03.9503852Z remote: Counting objects: 19% (22/111)  
2026-02-21T06:32:03.9504787Z remote: Counting objects: 20% (23/111)  
2026-02-21T06:32:03.9505934Z remote: Counting objects: 21% (24/111)  
2026-02-21T06:32:03.9506878Z remote: Counting objects: 22% (25/111)  
2026-02-21T06:32:03.9507807Z remote: Counting objects: 23% (26/111)  
2026-02-21T06:32:03.9509014Z remote: Counting objects: 24% (27/111)  
2026-02-21T06:32:03.9509936Z remote: Counting objects: 25% (28/111)  
2026-02-21T06:32:03.9510851Z remote: Counting objects: 26% (29/111)  
2026-02-21T06:32:03.9511779Z remote: Counting objects: 27% (30/111)  
2026-02-21T06:32:03.9512789Z remote: Counting objects: 28% (32/111)  
2026-02-21T06:32:03.9513732Z remote: Counting objects: 29% (33/111)  
2026-02-21T06:32:03.9514641Z remote: Counting objects: 30% (34/111)  
2026-02-21T06:32:03.9515851Z remote: Counting objects: 31% (35/111)  
2026-02-21T06:32:03.9516783Z remote: Counting objects: 32% (36/111)  
2026-02-21T06:32:03.9517700Z remote: Counting objects: 33% (37/111)  
2026-02-21T06:32:03.9518575Z remote: Counting objects: 34% (38/111)  
2026-02-21T06:32:03.9519468Z remote: Counting objects: 35% (39/111)  
2026-02-21T06:32:03.9520357Z remote: Counting objects: 36% (40/111)  
2026-02-21T06:32:03.9521248Z remote: Counting objects: 37% (42/111)  
2026-02-21T06:32:03.9522120Z remote: Counting objects: 38% (43/111)  
2026-02-21T06:32:03.9522979Z remote: Counting objects: 39% (44/111)  
2026-02-21T06:32:03.9524442Z remote: Counting objects: 40% (45/111)  
2026-02-21T06:32:03.9526081Z remote: Counting objects: 41% (46/111)  
2026-02-21T06:32:03.9527497Z remote: Counting objects: 42% (47/111)  
2026-02-21T06:32:03.9528704Z remote: Counting objects: 43% (48/111)  
2026-02-21T06:32:03.9529592Z remote: Counting objects: 44% (49/111)  
2026-02-21T06:32:03.9530445Z remote: Counting objects: 45% (50/111)  
2026-02-21T06:32:03.9531295Z remote: Counting objects: 46% (52/111)  
2026-02-21T06:32:03.9532153Z remote: Counting objects: 47% (53/111)  
2026-02-21T06:32:03.9533249Z remote: Counting objects: 48% (54/111)  
2026-02-21T06:32:03.9534137Z remote: Counting objects: 49% (55/111)  
2026-02-21T06:32:03.9534997Z remote: Counting objects: 50% (56/111)  
2026-02-21T06:32:03.9536088Z remote: Counting objects: 51% (57/111)  
2026-02-21T06:32:03.9536935Z remote: Counting objects: 52% (58/111)  
2026-02-21T06:32:03.9537782Z remote: Counting objects: 53% (59/111)  
2026-02-21T06:32:03.9538649Z remote: Counting objects: 54% (60/111)  
2026-02-21T06:32:03.9539510Z remote: Counting objects: 55% (62/111)  
2026-02-21T06:32:03.9540387Z remote: Counting objects: 56% (63/111)  
2026-02-21T06:32:03.9541249Z remote: Counting objects: 57% (64/111)  
2026-02-21T06:32:03.9542103Z remote: Counting objects: 58% (65/111)  
2026-02-21T06:32:03.9542957Z remote: Counting objects: 59% (66/111)  
2026-02-21T06:32:03.9543922Z remote: Counting objects: 60% (67/111)  
2026-02-21T06:32:03.9544784Z remote: Counting objects: 61% (68/111)  
2026-02-21T06:32:03.9545767Z remote: Counting objects: 62% (69/111)  
2026-02-21T06:32:03.9546635Z remote: Counting objects: 63% (70/111)  
2026-02-21T06:32:03.9547507Z remote: Counting objects: 64% (72/111)  
2026-02-21T06:32:03.9548367Z remote: Counting objects: 65% (73/111)  
2026-02-21T06:32:03.9549217Z remote: Counting objects: 66% (74/111)  
2026-02-21T06:32:03.9550072Z remote: Counting objects: 67% (75/111)  
2026-02-21T06:32:03.9550952Z remote: Counting objects: 68% (76/111)  
2026-02-21T06:32:03.9551822Z remote: Counting objects: 69% (77/111)  
2026-02-21T06:32:03.9552709Z remote: Counting objects: 70% (78/111)  
2026-02-21T06:32:03.9553591Z remote: Counting objects: 71% (79/111)  
2026-02-21T06:32:03.9554846Z remote: Counting objects: 72% (80/111)  
2026-02-21T06:32:03.9556472Z remote: Counting objects: 73% (82/111)  
2026-02-21T06:32:03.9557885Z remote: Counting objects: 74% (83/111)  
2026-02-21T06:32:03.9559089Z remote: Counting objects: 75% (84/111)  
2026-02-21T06:32:03.9560022Z remote: Counting objects: 76% (85/111)  
2026-02-21T06:32:03.9561088Z remote: Counting objects: 77% (86/111)  
2026-02-21T06:32:03.9561971Z remote: Counting objects: 78% (87/111)  
2026-02-21T06:32:03.9562836Z remote: Counting objects: 79% (88/111)  
2026-02-21T06:32:03.9563743Z remote: Counting objects: 80% (89/111)  
2026-02-21T06:32:03.9564603Z remote: Counting objects: 81% (90/111)  
2026-02-21T06:32:03.9565690Z remote: Counting objects: 82% (92/111)  
2026-02-21T06:32:03.9566564Z remote: Counting objects: 83% (93/111)  
2026-02-21T06:32:03.9567435Z remote: Counting objects: 84% (94/111)  
2026-02-21T06:32:03.9568296Z remote: Counting objects: 85% (95/111)  
2026-02-21T06:32:03.9569157Z remote: Counting objects: 86% (96/111)  
2026-02-21T06:32:03.9570052Z remote: Counting objects: 87% (97/111)  
2026-02-21T06:32:03.9570946Z remote: Counting objects: 88% (98/111)  
2026-02-21T06:32:03.9572209Z remote: Counting objects: 89% (99/111)  
2026-02-21T06:32:03.9573579Z remote: Counting objects: 90% (100/111)  
2026-02-21T06:32:03.9574496Z remote: Counting objects: 91% (102/111)  
2026-02-21T06:32:03.9575525Z remote: Counting objects: 92% (103/111)  
2026-02-21T06:32:03.9576415Z remote: Counting objects: 93% (104/111)  
2026-02-21T06:32:03.9577298Z remote: Counting objects: 94% (105/111)  
2026-02-21T06:32:03.9578180Z remote: Counting objects: 95% (106/111)  
2026-02-21T06:32:03.9579068Z remote: Counting objects: 96% (107/111)  
2026-02-21T06:32:03.9579961Z remote: Counting objects: 97% (108/111)  
2026-02-21T06:32:03.9580838Z remote: Counting objects: 98% (109/111)  
2026-02-21T06:32:03.9581713Z remote: Counting objects: 99% (110/111)  
2026-02-21T06:32:03.9582563Z remote: Counting objects: 100% (111/111)  
2026-02-21T06:32:03.9583666Z remote: Counting objects: 100% (111/111), done.  
2026-02-21T06:32:03.9584608Z remote: Compressing objects: 1% (1/98)  
2026-02-21T06:32:03.9585590Z remote: Compressing objects: 2% (2/98)  
2026-02-21T06:32:03.9586451Z remote: Compressing objects: 3% (3/98)  
2026-02-21T06:32:03.9587305Z remote: Compressing objects: 4% (4/98)  
2026-02-21T06:32:03.9588162Z remote: Compressing objects: 5% (5/98)  
2026-02-21T06:32:03.9589004Z remote: Compressing objects: 6% (6/98)  
2026-02-21T06:32:03.9589855Z remote: Compressing objects: 7% (7/98)  
2026-02-21T06:32:03.9590717Z remote: Compressing objects: 8% (8/98)  
2026-02-21T06:32:03.9591568Z remote: Compressing objects: 9% (9/98)  
2026-02-21T06:32:03.9592425Z remote: Compressing objects: 10% (10/98)  
2026-02-21T06:32:03.9593308Z remote: Compressing objects: 11% (11/98)  
2026-02-21T06:32:03.9594178Z remote: Compressing objects: 12% (12/98)  
2026-02-21T06:32:03.9595159Z remote: Compressing objects: 13% (13/98)  
2026-02-21T06:32:03.9596048Z remote: Compressing objects: 14% (14/98)  
2026-02-21T06:32:03.9596924Z remote: Compressing objects: 15% (15/98)  
2026-02-21T06:32:03.9597806Z remote: Compressing objects: 16% (16/98)  
2026-02-21T06:32:03.9598671Z remote: Compressing objects: 17% (17/98)  
2026-02-21T06:32:03.9599560Z remote: Compressing objects: 18% (18/98)  
2026-02-21T06:32:03.9600441Z remote: Compressing objects: 19% (19/98)  
2026-02-21T06:32:03.9601324Z remote: Compressing objects: 20% (20/98)  
2026-02-21T06:32:03.9602210Z remote: Compressing objects: 21% (21/98)  
2026-02-21T06:32:03.9603091Z remote: Compressing objects: 22% (22/98)  
2026-02-21T06:32:03.9603976Z remote: Compressing objects: 23% (23/98)  
2026-02-21T06:32:03.9604854Z remote: Compressing objects: 24% (24/98)  
2026-02-21T06:32:03.9605821Z remote: Compressing objects: 25% (25/98)  
2026-02-21T06:32:03.9606713Z remote: Compressing objects: 26% (26/98)  
2026-02-21T06:32:03.9607592Z remote: Compressing objects: 27% (27/98)  
2026-02-21T06:32:03.9608612Z remote: Compressing objects: 28% (28/98)  
2026-02-21T06:32:03.9609509Z remote: Compressing objects: 29% (29/98)  
2026-02-21T06:32:03.9610394Z remote: Compressing objects: 30% (30/98)  
2026-02-21T06:32:03.9611288Z remote: Compressing objects: 31% (31/98)  
2026-02-21T06:32:03.9612178Z remote: Compressing objects: 32% (32/98)  
2026-02-21T06:32:03.9613049Z remote: Compressing objects: 33% (33/98)  
2026-02-21T06:32:03.9613945Z remote: Compressing objects: 34% (34/98)  
2026-02-21T06:32:03.9614822Z remote: Compressing objects: 35% (35/98)  
2026-02-21T06:32:03.9615812Z remote: Compressing objects: 36% (36/98)  
2026-02-21T06:32:03.9616686Z remote: Compressing objects: 37% (37/98)  
2026-02-21T06:32:03.9617554Z remote: Compressing objects: 38% (38/98)  
2026-02-21T06:32:03.9618433Z remote: Compressing objects: 39% (39/98)  
2026-02-21T06:32:03.9619301Z remote: Compressing objects: 40% (40/98)  
2026-02-21T06:32:03.9620182Z remote: Compressing objects: 41% (41/98)  
2026-02-21T06:32:03.9621040Z remote: Compressing objects: 42% (42/98)  
2026-02-21T06:32:03.9621910Z remote: Compressing objects: 43% (43/98)  
2026-02-21T06:32:03.9622787Z remote: Compressing objects: 44% (44/98)  
2026-02-21T06:32:03.9623656Z remote: Compressing objects: 45% (45/98)  
2026-02-21T06:32:03.9624536Z remote: Compressing objects: 46% (46/98)  
2026-02-21T06:32:03.9625511Z remote: Compressing objects: 47% (47/98)  
2026-02-21T06:32:03.9626392Z remote: Compressing objects: 48% (48/98)  
2026-02-21T06:32:03.9627292Z remote: Compressing objects: 50% (49/98)  
2026-02-21T06:32:03.9628170Z remote: Compressing objects: 51% (50/98)  
2026-02-21T06:32:03.9629095Z remote: Compressing objects: 52% (51/98)  
2026-02-21T06:32:03.9630079Z remote: Compressing objects: 53% (52/98)  
2026-02-21T06:32:03.9630963Z remote: Compressing objects: 54% (53/98)  
2026-02-21T06:32:03.9631839Z remote: Compressing objects: 55% (54/98)  
2026-02-21T06:32:03.9632706Z remote: Compressing objects: 56% (55/98)  
2026-02-21T06:32:03.9633573Z remote: Compressing objects: 57% (56/98)  
2026-02-21T06:32:03.9634441Z remote: Compressing objects: 58% (57/98)  
2026-02-21T06:32:03.9635400Z remote: Compressing objects: 59% (58/98)  
2026-02-21T06:32:03.9636275Z remote: Compressing objects: 60% (59/98)  
2026-02-21T06:32:03.9637136Z remote: Compressing objects: 61% (60/98)  
2026-02-21T06:32:03.9637997Z remote: Compressing objects: 62% (61/98)  
2026-02-21T06:32:03.9638861Z remote: Compressing objects: 63% (62/98)  
2026-02-21T06:32:03.9639730Z remote: Compressing objects: 64% (63/98)  
2026-02-21T06:32:03.9640592Z remote: Compressing objects: 65% (64/98)  
2026-02-21T06:32:03.9641458Z remote: Compressing objects: 66% (65/98)  
2026-02-21T06:32:03.9705509Z remote: Compressing objects: 67% (66/98)  
2026-02-21T06:32:03.9707173Z remote: Compressing objects: 68% (67/98)  
2026-02-21T06:32:03.9708402Z remote: Compressing objects: 69% (68/98)  
2026-02-21T06:32:03.9709768Z remote: Compressing objects: 70% (69/98)  
2026-02-21T06:32:03.9711001Z remote: Compressing objects: 71% (70/98)  
2026-02-21T06:32:03.9712051Z remote: Compressing objects: 72% (71/98)  
2026-02-21T06:32:03.9712949Z remote: Compressing objects: 73% (72/98)  
2026-02-21T06:32:03.9713840Z remote: Compressing objects: 74% (73/98)  
2026-02-21T06:32:03.9714732Z remote: Compressing objects: 75% (74/98)  
2026-02-21T06:32:03.9715864Z remote: Compressing objects: 76% (75/98)  
2026-02-21T06:32:03.9716745Z remote: Compressing objects: 77% (76/98)  
2026-02-21T06:32:03.9717619Z remote: Compressing objects: 78% (77/98)  
2026-02-21T06:32:03.9718503Z remote: Compressing objects: 79% (78/98)  
2026-02-21T06:32:03.9719372Z remote: Compressing objects: 80% (79/98)  
2026-02-21T06:32:03.9720449Z remote: Compressing objects: 81% (80/98)  
2026-02-21T06:32:03.9721307Z remote: Compressing objects: 82% (81/98)  
2026-02-21T06:32:03.9722180Z remote: Compressing objects: 83% (82/98)  
2026-02-21T06:32:03.9723049Z remote: Compressing objects: 84% (83/98)  
2026-02-21T06:32:03.9723920Z remote: Compressing objects: 85% (84/98)  
2026-02-21T06:32:03.9724789Z remote: Compressing objects: 86% (85/98)  
2026-02-21T06:32:03.9725999Z remote: Compressing objects: 87% (86/98)  
2026-02-21T06:32:03.9726880Z remote: Compressing objects: 88% (87/98)  
2026-02-21T06:32:03.9727768Z remote: Compressing objects: 89% (88/98)  
2026-02-21T06:32:03.9728639Z remote: Compressing objects: 90% (89/98)  
2026-02-21T06:32:03.9729519Z remote: Compressing objects: 91% (90/98)  
2026-02-21T06:32:03.9730433Z remote: Compressing objects: 92% (91/98)  
2026-02-21T06:32:03.9731307Z remote: Compressing objects: 93% (92/98)  
2026-02-21T06:32:03.9732182Z remote: Compressing objects: 94% (93/98)  
2026-02-21T06:32:03.9733195Z remote: Compressing objects: 95% (94/98)  
2026-02-21T06:32:03.9734078Z remote: Compressing objects: 96% (95/98)  
2026-02-21T06:32:03.9734939Z remote: Compressing objects: 97% (96/98)  
2026-02-21T06:32:03.9736073Z remote: Compressing objects: 98% (97/98)  
2026-02-21T06:32:03.9736942Z remote: Compressing objects: 100% (98/98)  
2026-02-21T06:32:03.9737866Z remote: Compressing objects: 100% (98/98), done.  
2026-02-21T06:32:03.9738799Z Receiving objects: 0% (1/111)
2026-02-21T06:32:03.9739488Z Receiving objects: 1% (2/111)
2026-02-21T06:32:03.9740172Z Receiving objects: 2% (3/111)
2026-02-21T06:32:03.9740852Z Receiving objects: 3% (4/111)
2026-02-21T06:32:03.9741534Z Receiving objects: 4% (5/111)
2026-02-21T06:32:03.9742206Z Receiving objects: 5% (6/111)
2026-02-21T06:32:03.9743042Z Receiving objects: 6% (7/111)
2026-02-21T06:32:03.9743744Z Receiving objects: 7% (8/111)
2026-02-21T06:32:03.9744424Z Receiving objects: 8% (9/111)
2026-02-21T06:32:03.9745224Z Receiving objects: 9% (10/111)
2026-02-21T06:32:03.9745942Z Receiving objects: 10% (12/111)
2026-02-21T06:32:03.9746641Z Receiving objects: 11% (13/111)
2026-02-21T06:32:03.9747326Z Receiving objects: 12% (14/111)
2026-02-21T06:32:03.9748009Z Receiving objects: 13% (15/111)
2026-02-21T06:32:03.9748687Z Receiving objects: 14% (16/111)
2026-02-21T06:32:03.9749367Z Receiving objects: 15% (17/111)
2026-02-21T06:32:03.9750277Z Receiving objects: 16% (18/111)
2026-02-21T06:32:03.9750972Z Receiving objects: 17% (19/111)
2026-02-21T06:32:03.9752120Z Receiving objects: 18% (20/111)
2026-02-21T06:32:03.9753347Z Receiving objects: 19% (22/111)
2026-02-21T06:32:03.9754497Z Receiving objects: 20% (23/111)
2026-02-21T06:32:03.9755923Z Receiving objects: 21% (24/111)
2026-02-21T06:32:03.9756994Z Receiving objects: 22% (25/111)
2026-02-21T06:32:03.9757707Z Receiving objects: 23% (26/111)
2026-02-21T06:32:03.9758463Z Receiving objects: 24% (27/111)
2026-02-21T06:32:03.9759149Z Receiving objects: 25% (28/111)
2026-02-21T06:32:03.9833116Z Receiving objects: 26% (29/111)
2026-02-21T06:32:03.9834709Z Receiving objects: 27% (30/111)
2026-02-21T06:32:03.9836364Z Receiving objects: 28% (32/111)
2026-02-21T06:32:03.9837817Z Receiving objects: 29% (33/111)
2026-02-21T06:32:03.9839248Z Receiving objects: 30% (34/111)
2026-02-21T06:32:03.9840496Z Receiving objects: 31% (35/111)
2026-02-21T06:32:03.9841642Z Receiving objects: 32% (36/111)
2026-02-21T06:32:03.9842814Z Receiving objects: 33% (37/111)
2026-02-21T06:32:03.9843964Z Receiving objects: 34% (38/111)
2026-02-21T06:32:03.9845244Z Receiving objects: 35% (39/111)
2026-02-21T06:32:03.9846400Z Receiving objects: 36% (40/111)
2026-02-21T06:32:03.9847541Z Receiving objects: 37% (42/111)
2026-02-21T06:32:03.9848674Z Receiving objects: 38% (43/111)
2026-02-21T06:32:03.9849840Z Receiving objects: 39% (44/111)
2026-02-21T06:32:03.9850980Z Receiving objects: 40% (45/111)
2026-02-21T06:32:03.9852353Z Receiving objects: 41% (46/111)
2026-02-21T06:32:03.9853501Z Receiving objects: 42% (47/111)
2026-02-21T06:32:03.9854640Z Receiving objects: 43% (48/111)
2026-02-21T06:32:03.9855909Z Receiving objects: 44% (49/111)
2026-02-21T06:32:03.9856633Z Receiving objects: 45% (50/111)
2026-02-21T06:32:03.9857317Z Receiving objects: 46% (52/111)
2026-02-21T06:32:03.9858005Z Receiving objects: 47% (53/111)
2026-02-21T06:32:03.9858692Z Receiving objects: 48% (54/111)
2026-02-21T06:32:03.9859361Z Receiving objects: 49% (55/111)
2026-02-21T06:32:03.9860045Z Receiving objects: 50% (56/111)
2026-02-21T06:32:03.9860736Z Receiving objects: 51% (57/111)
2026-02-21T06:32:03.9861416Z Receiving objects: 52% (58/111)
2026-02-21T06:32:03.9862102Z Receiving objects: 53% (59/111)
2026-02-21T06:32:03.9862814Z Receiving objects: 54% (60/111)
2026-02-21T06:32:03.9863510Z Receiving objects: 55% (62/111)
2026-02-21T06:32:03.9864185Z Receiving objects: 56% (63/111)
2026-02-21T06:32:03.9864874Z Receiving objects: 57% (64/111)
2026-02-21T06:32:03.9865792Z Receiving objects: 58% (65/111)
2026-02-21T06:32:03.9866471Z Receiving objects: 59% (66/111)
2026-02-21T06:32:03.9867153Z Receiving objects: 60% (67/111)
2026-02-21T06:32:03.9867828Z Receiving objects: 61% (68/111)
2026-02-21T06:32:03.9868492Z Receiving objects: 62% (69/111)
2026-02-21T06:32:03.9869156Z Receiving objects: 63% (70/111)
2026-02-21T06:32:03.9869829Z Receiving objects: 64% (72/111)
2026-02-21T06:32:03.9870500Z Receiving objects: 65% (73/111)
2026-02-21T06:32:03.9871167Z Receiving objects: 66% (74/111)
2026-02-21T06:32:03.9871846Z Receiving objects: 67% (75/111)
2026-02-21T06:32:03.9872519Z Receiving objects: 68% (76/111)
2026-02-21T06:32:03.9873175Z Receiving objects: 69% (77/111)
2026-02-21T06:32:03.9873840Z Receiving objects: 70% (78/111)
2026-02-21T06:32:03.9874511Z Receiving objects: 71% (79/111)
2026-02-21T06:32:03.9875419Z Receiving objects: 72% (80/111)
2026-02-21T06:32:03.9876129Z Receiving objects: 73% (82/111)
2026-02-21T06:32:03.9876809Z Receiving objects: 74% (83/111)
2026-02-21T06:32:03.9877476Z Receiving objects: 75% (84/111)
2026-02-21T06:32:03.9878154Z Receiving objects: 76% (85/111)
2026-02-21T06:32:03.9878826Z Receiving objects: 77% (86/111)
2026-02-21T06:32:03.9879502Z Receiving objects: 78% (87/111)
2026-02-21T06:32:03.9884426Z Receiving objects: 79% (88/111)
2026-02-21T06:32:03.9885984Z Receiving objects: 80% (89/111)
2026-02-21T06:32:03.9915725Z Receiving objects: 81% (90/111)
2026-02-21T06:32:03.9917279Z Receiving objects: 82% (92/111)
2026-02-21T06:32:03.9918711Z Receiving objects: 83% (93/111)
2026-02-21T06:32:03.9919772Z Receiving objects: 84% (94/111)
2026-02-21T06:32:03.9931684Z Receiving objects: 85% (95/111)
2026-02-21T06:32:03.9932933Z Receiving objects: 86% (96/111)
2026-02-21T06:32:03.9934030Z Receiving objects: 87% (97/111)
2026-02-21T06:32:03.9935283Z Receiving objects: 88% (98/111)
2026-02-21T06:32:03.9936027Z Receiving objects: 89% (99/111)
2026-02-21T06:32:04.0012273Z Receiving objects: 90% (100/111)
2026-02-21T06:32:04.0013613Z Receiving objects: 91% (102/111)
2026-02-21T06:32:04.0017798Z Receiving objects: 92% (103/111)
2026-02-21T06:32:04.0019258Z Receiving objects: 93% (104/111)
2026-02-21T06:32:04.0021111Z remote: Total 111 (delta 7), reused 67 (delta 7), pack-reused 0 (from 0)  
2026-02-21T06:32:04.0022922Z Receiving objects: 94% (105/111)
2026-02-21T06:32:04.0024128Z Receiving objects: 95% (106/111)
2026-02-21T06:32:04.0025566Z Receiving objects: 96% (107/111)
2026-02-21T06:32:04.0026802Z Receiving objects: 97% (108/111)
2026-02-21T06:32:04.0028046Z Receiving objects: 98% (109/111)
2026-02-21T06:32:04.0029302Z Receiving objects: 99% (110/111)
2026-02-21T06:32:04.0030570Z Receiving objects: 100% (111/111)
2026-02-21T06:32:04.0032002Z Receiving objects: 100% (111/111), 99.67 KiB | 2.85 MiB/s, done.
2026-02-21T06:32:04.0033805Z Resolving deltas: 0% (0/7)
2026-02-21T06:32:04.0034889Z Resolving deltas: 14% (1/7)
2026-02-21T06:32:04.0047593Z Resolving deltas: 28% (2/7)
2026-02-21T06:32:04.0048531Z Resolving deltas: 42% (3/7)
2026-02-21T06:32:04.0049620Z Resolving deltas: 57% (4/7)
2026-02-21T06:32:04.0050631Z Resolving deltas: 71% (5/7)
2026-02-21T06:32:04.0051406Z Resolving deltas: 85% (6/7)
2026-02-21T06:32:04.0052134Z Resolving deltas: 100% (7/7)
2026-02-21T06:32:04.0053068Z Resolving deltas: 100% (7/7), done.
2026-02-21T06:32:04.0102507Z From https://github.com/Hytale-Paotheon/Paotheon
2026-02-21T06:32:04.0104420Z * [new ref] df4bb00d9b752e050392062032e25e18e40f8787 -> origin/main
2026-02-21T06:32:04.0135961Z ##[endgroup]
2026-02-21T06:32:04.0137003Z ##[group]Determining the checkout info
2026-02-21T06:32:04.0138632Z ##[endgroup]
2026-02-21T06:32:04.0139557Z ##[group]Checking out the ref
2026-02-21T06:32:04.0142449Z [command]/usr/bin/git checkout --progress --force -B main refs/remotes/origin/main
2026-02-21T06:32:04.0228123Z Switched to a new branch 'main'
2026-02-21T06:32:04.0230891Z branch 'main' set up to track 'origin/main'.
2026-02-21T06:32:04.0238821Z ##[endgroup]
2026-02-21T06:32:04.0272118Z [command]/usr/bin/git log -1 --format='%H'
2026-02-21T06:32:04.0292806Z 'df4bb00d9b752e050392062032e25e18e40f8787'
2026-02-21T06:32:04.0514224Z ##[group]Run echo "--- Conteúdo do find-mod-ids.sh ---"
2026-02-21T06:32:04.0515550Z [36;1mecho "--- Conteúdo do find-mod-ids.sh ---"[0m
2026-02-21T06:32:04.0516419Z [36;1mcat scripts/find-mod-ids.sh[0m
2026-02-21T06:32:04.0517170Z [36;1mecho "--- Fim do conteúdo ---"[0m
2026-02-21T06:32:04.0553975Z shell: /usr/bin/bash -e {0}
2026-02-21T06:32:04.0554683Z ##[endgroup]
2026-02-21T06:32:04.0636873Z --- Conteúdo do find-mod-ids.sh ---
2026-02-21T06:32:04.0646371Z #!/bin/bash
2026-02-21T06:32:04.0647304Z set -euo pipefail
2026-02-21T06:32:04.0647868Z
2026-02-21T06:32:04.0648289Z # --- Configuration ---
2026-02-21T06:32:04.0649527Z HYTALE_GAME_ID=70216
2026-02-21T06:32:04.0650589Z QUIET_MODE=0
2026-02-21T06:32:04.0651112Z
2026-02-21T06:32:04.0651456Z # --- Function Definitions ---
2026-02-21T06:32:04.0652208Z print_usage() {
2026-02-21T06:32:04.0653103Z echo "Uso: $0 [OPÇÕES] [\"Nome do Mod 1\" \"outro-mod\"...]" >&2
2026-02-21T06:32:04.0654199Z echo " Busca Project IDs de mods no CurseForge." >&2
2026-02-21T06:32:04.0655272Z echo "" >&2
2026-02-21T06:32:04.0656525Z echo " Se nenhum nome de mod for fornecido como argumento, tentará ler da entrada padrão (stdin)." >&2
2026-02-21T06:32:04.0657804Z echo "" >&2
2026-02-21T06:32:04.0658395Z echo "Opções:" >&2
2026-02-21T06:32:04.0659652Z echo " -q, --quiet Gera uma saída limpa apenas com os IDs separados por espaço, para uso em scripts." >&2
2026-02-21T06:32:04.0661023Z echo " -h, --help Mostra esta ajuda." >&2
2026-02-21T06:32:04.0661825Z echo "" >&2
2026-02-21T06:32:04.0662399Z echo "Pré-requisitos:" >&2
2026-02-21T06:32:04.0663132Z echo " - 'curl' e 'jq' devem estar instalados." >&2
2026-02-21T06:32:04.0664273Z echo " - A variável de ambiente CURSEFORGE_API_KEY deve estar definida." >&2
2026-02-21T06:32:04.0665569Z }
2026-02-21T06:32:04.0665892Z
2026-02-21T06:32:04.0666198Z # --- Argument Parsing ---
2026-02-21T06:32:04.0666897Z MOD_NAMES=()
2026-02-21T06:32:04.0667524Z while [[$# -gt 0]]; do
2026-02-21T06:32:04.0668128Z case $1 in
2026-02-21T06:32:04.0668640Z -q|--quiet)
2026-02-21T06:32:04.0669183Z QUIET_MODE=1
2026-02-21T06:32:04.0669709Z shift
2026-02-21T06:32:04.0670201Z ;;
2026-02-21T06:32:04.0670695Z -h|--help)
2026-02-21T06:32:04.0671219Z print_usage
2026-02-21T06:32:04.0671788Z exit 0
2026-02-21T06:32:04.0672335Z ;;
2026-02-21T06:32:04.0672813Z *)
2026-02-21T06:32:04.0673308Z MOD_NAMES+=("$1")
2026-02-21T06:32:04.0673899Z       shift
2026-02-21T06:32:04.0674390Z       ;;
2026-02-21T06:32:04.0674877Z   esac
2026-02-21T06:32:04.0675637Z done
2026-02-21T06:32:04.0675908Z 
2026-02-21T06:32:04.0676169Z # --- Prerequisite Checks ---
2026-02-21T06:32:04.0677039Z if ! command -v curl &> /dev/null || ! command -v jq &> /dev/null; then
2026-02-21T06:32:04.0678450Z   echo "ERRO: Este script requer 'curl' e 'jq'. Por favor, instale-os." >&2
2026-02-21T06:32:04.0679412Z   exit 1
2026-02-21T06:32:04.0679896Z fi
2026-02-21T06:32:04.0680156Z 
2026-02-21T06:32:04.0680437Z if [ -z "${CURSEFORGE_API_KEY:-}" ]; then
2026-02-21T06:32:04.0681532Z echo "ERRO: A variável de ambiente CURSEFORGE_API_KEY não está definida." >&2
2026-02-21T06:32:04.0682546Z print_usage
2026-02-21T06:32:04.0683059Z exit 1
2026-02-21T06:32:04.0683540Z fi
2026-02-21T06:32:04.0683792Z
2026-02-21T06:32:04.0684032Z # --- Main Logic ---
2026-02-21T06:32:04.0684823Z # Se nenhum nome de mod foi passado via argumento, lê do stdin.
2026-02-21T06:32:04.0686059Z if [ ${#MOD_NAMES[@]} -eq 0 ]; then
2026-02-21T06:32:04.0686965Z   if [ -t 0 ]; then # Verifica se stdin é um terminal (interativo)
2026-02-21T06:32:04.0687851Z       if [ ${QUIET_MODE} -eq 0 ]; then
2026-02-21T06:32:04.0688534Z         print_usage
2026-02-21T06:32:04.0689069Z       fi
2026-02-21T06:32:04.0689562Z       exit 0
2026-02-21T06:32:04.0690077Z   fi
2026-02-21T06:32:04.0690589Z   # Lê do pipe
2026-02-21T06:32:04.0691139Z   while IFS= read -r line; do
2026-02-21T06:32:04.0691792Z     # Ignora linhas vazias
2026-02-21T06:32:04.0692650Z     [[ -n "$line" ]] && MOD_NAMES+=("$line")
2026-02-21T06:32:04.0693390Z   done < /dev/stdin
2026-02-21T06:32:04.0693918Z fi
2026-02-21T06:32:04.0694183Z 
2026-02-21T06:32:04.0694439Z if [ ${#MOD_NAMES[@]} -eq 0 ]; then
2026-02-21T06:32:04.0695399Z   if [ ${QUIET_MODE} -eq 0 ]; then
2026-02-21T06:32:04.0696182Z     echo "Nenhum mod fornecido para busca." >&2
2026-02-21T06:32:04.0696924Z   fi
2026-02-21T06:32:04.0697401Z   exit 0
2026-02-21T06:32:04.0697879Z fi
2026-02-21T06:32:04.0698135Z 
2026-02-21T06:32:04.0698143Z 
2026-02-21T06:32:04.0698399Z if [ ${QUIET_MODE} -eq 0 ]; then
2026-02-21T06:32:04.0699302Z   echo "Buscando Project IDs para Hytale (Game ID: ${HYTALE_GAME_ID})..."
2026-02-21T06:32:04.0700259Z   echo "---"
2026-02-21T06:32:04.0700756Z fi
2026-02-21T06:32:04.0701015Z 
2026-02-21T06:32:04.0701250Z ID_LIST=""
2026-02-21T06:32:04.0701836Z for original_mod_name in "${MOD_NAMES[@]}"; do
2026-02-21T06:32:04.0702718Z # Extrai a parte do nome após o último ':'
2026-02-21T06:32:04.0703509Z # Ex: "Buuz135:AdminUI" se torna "AdminUI"
2026-02-21T06:32:04.0704303Z # Se não houver ':', usa o nome original
2026-02-21T06:32:04.0705284Z mod_name_to_search="${original_mod_name##*:}"
2026-02-21T06:32:04.0705873Z 
2026-02-21T06:32:04.0706420Z   # Usa --data-urlencode para que o curl codifique o nome do mod automaticamente
2026-02-21T06:32:04.0707622Z   response=$(curl -s -G -H "x-api-key: ${CURSEFORGE_API_KEY}" \
2026-02-21T06:32:04.0708602Z     "https://api.curseforge.com/v1/mods/search" \
2026-02-21T06:32:04.0709447Z     --data-urlencode "gameId=${HYTALE_GAME_ID}" \
2026-02-21T06:32:04.0710348Z --data-urlencode "searchFilter=${mod_name_to_search}" \
2026-02-21T06:32:04.0711218Z     --data-urlencode "sortField=2" \
2026-02-21T06:32:04.0711931Z     --data-urlencode "sortOrder=desc")
2026-02-21T06:32:04.0712414Z 
2026-02-21T06:32:04.0712760Z   project_id=$(echo "$response" | jq -r '.data[0].id')
2026-02-21T06:32:04.0713325Z 
2026-02-21T06:32:04.0713583Z   if [ ${QUIET_MODE} -eq 0 ]; then
2026-02-21T06:32:04.0714389Z     project_name=$(echo "$response" | jq -r '.data[0].name')
2026-02-21T06:32:04.0715566Z     project_slug=$(echo "$response" | jq -r '.data[0].slug')
2026-02-21T06:32:04.0716181Z 
2026-02-21T06:32:04.0716551Z     if [ -n "$project_id" ] && [ "$project_id" != "null" ]; then
2026-02-21T06:32:04.0717680Z printf "Busca: '%-25s' -> Encontrado: '%-30s' | Project ID: %-10s | Slug: %s\n" \
2026-02-21T06:32:04.0718941Z "${original_mod_name}" "${project_name}" "${project_id}" "${project_slug}"
2026-02-21T06:32:04.0719910Z else
2026-02-21T06:32:04.0720695Z printf "Busca: '%-25s' -> NENHUM RESULTADO ENCONTRADO\n" "${original_mod_name}"
2026-02-21T06:32:04.0721677Z     fi
2026-02-21T06:32:04.0722168Z   else
2026-02-21T06:32:04.0722799Z     if [ -n "$project_id" ] && [ "$project_id" != "null" ]; then
2026-02-21T06:32:04.0723851Z ID_LIST="${ID_LIST}${project_id} "
2026-02-21T06:32:04.0724541Z fi
2026-02-21T06:32:04.0725166Z fi
2026-02-21T06:32:04.0725699Z done
2026-02-21T06:32:04.0725971Z
2026-02-21T06:32:04.0726227Z if [ ${QUIET_MODE} -eq 1 ]; then
2026-02-21T06:32:04.0727050Z # Remove o espaço final e imprime a lista de IDs
2026-02-21T06:32:04.0727848Z echo "${ID_LIST% }"
2026-02-21T06:32:04.0728400Z fi
2026-02-21T06:32:04.0728926Z --- Fim do conteúdo ---
2026-02-21T06:32:04.0800459Z ##[group]Run # Torna o script executável
2026-02-21T06:32:04.0801315Z [36;1m# Torna o script executável[0m
2026-02-21T06:32:04.0802073Z [36;1mchmod +x scripts/find-mod-ids.sh[0m
2026-02-21T06:32:04.0802787Z [36;1m[0m
2026-02-21T06:32:04.0803328Z [36;1mif [ -f mods/config.json ]; then[0m
2026-02-21T06:32:04.0804248Z [36;1m  echo "Extraindo nomes de mods de 'mods/config.json'..."[0m
2026-02-21T06:32:04.0805454Z [36;1m  MOD_NAMES=$(jq -r '.Mods | keys[]' mods/config.json)[0m
2026-02-21T06:32:04.0806329Z [36;1m[0m
2026-02-21T06:32:04.0806866Z [36;1m if [ -z "$MOD_NAMES" ]; then[0m
2026-02-21T06:32:04.0807753Z [36;1m echo "Nenhum mod encontrado em 'mods/config.json'."[0m
2026-02-21T06:32:04.0808686Z [36;1m echo "project_ids=" >> $GITHUB_OUTPUT[0m
2026-02-21T06:32:04.0809430Z [36;1m  else[0m
2026-02-21T06:32:04.0810139Z [36;1m    echo "Buscando Project IDs para os seguintes mods:"[0m
2026-02-21T06:32:04.0811005Z [36;1m    echo "$MOD_NAMES"[0m
2026-02-21T06:32:04.0812638Z [36;1m MOD_IDS=$(CURSEFORGE_API_KEY=*** scripts/find-mod-ids.sh -q <<< "$MOD_NAMES")[0m
2026-02-21T06:32:04.0813756Z [36;1m echo "Found mod IDs: $MOD_IDS"[0m
2026-02-21T06:32:04.0814603Z [36;1m    echo "project_ids=$MOD_IDS" >> $GITHUB_OUTPUT[0m
2026-02-21T06:32:04.0815515Z [36;1m fi[0m
2026-02-21T06:32:04.0816037Z [36;1melse[0m
2026-02-21T06:32:04.0816798Z [36;1m echo "mods/config.json not found, skipping mod ID search."[0m
2026-02-21T06:32:04.0817784Z [36;1m echo "project_ids=" >> $GITHUB_OUTPUT[0m
2026-02-21T06:32:04.0818542Z [36;1mfi[0m
2026-02-21T06:32:04.0850662Z shell: /usr/bin/bash -e {0}
2026-02-21T06:32:04.0851326Z ##[endgroup]
2026-02-21T06:32:04.0916555Z Extraindo nomes de mods de 'mods/config.json'...
2026-02-21T06:32:04.0947923Z Buscando Project IDs para os seguintes mods:
2026-02-21T06:32:04.0949337Z AmoAster:Kytale
2026-02-21T06:32:04.0949976Z ArmorStand:ArmorStand
2026-02-21T06:32:04.0951095Z AvidPixel:AvidPixel's Infinite Water Supply
2026-02-21T06:32:04.0952427Z B3cks:HyMenu
2026-02-21T06:32:04.0953389Z BackslashRobotics:WorldUpdater
2026-02-21T06:32:04.0954538Z BetterBridges:Bridges
2026-02-21T06:32:04.0955418Z BlackAures:Aures - Horse Skins
2026-02-21T06:32:04.0956132Z BlackAures:Aures - Livestock Skins
2026-02-21T06:32:04.0956821Z BlameJared:ItemMagnet
2026-02-21T06:32:04.0957411Z BlameJared:MinersHelmet
2026-02-21T06:32:04.0958022Z BlameJared:SimplyTrash
2026-02-21T06:32:04.0958612Z BlameJared:ThoriumChests
2026-02-21T06:32:04.0959226Z BlameJared:ThoriumFurnaces
2026-02-21T06:32:04.0959859Z Bonnibel:Arrow Hud
2026-02-21T06:32:04.0960411Z Build-9:Hyxin
2026-02-21T06:32:04.0960935Z Buuz135:AdminUI
2026-02-21T06:32:04.0961482Z Buuz135:AdvancedItemInfo
2026-02-21T06:32:04.0962082Z Buuz135:BetterModlist
2026-02-21T06:32:04.0962651Z Buuz135:LuckyMining
2026-02-21T06:32:04.0963193Z Buuz135:MultipleHUD
2026-02-21T06:32:04.0963739Z Buuz135:SimpleClaims
2026-02-21T06:32:04.0964300Z Buuz135:WhereThisAt
2026-02-21T06:32:04.0964858Z ChestRangeMod:ChestRangeMod
2026-02-21T06:32:04.0965731Z CoinsAndMarkets:Coins & Markets
2026-02-21T06:32:04.0966378Z Conczin:Resource Groups
2026-02-21T06:32:04.0966970Z Conczin:Ymmersive Carpentry
2026-02-21T06:32:04.0967590Z Conczin:Ymmersive Masonry
2026-02-21T06:32:04.0968198Z Conczin:Ymmersive Melodies
2026-02-21T06:32:04.0968824Z Config:Endgame&QoL
2026-02-21T06:32:04.0969398Z CowMaster:Hyfarm
2026-02-21T06:32:04.0969957Z CowMaster:Salvage Everything
2026-02-21T06:32:04.0970576Z Darkhax:Spellbook
2026-02-21T06:32:04.0971126Z Darkhax:WaybackCharm
2026-02-21T06:32:04.0971911Z DasEric:ChestTerminal
2026-02-21T06:32:04.0972522Z DeftestJester:SecretSlidingDoorBlocks
2026-02-21T06:32:04.0973231Z DejansMods:Dejans_Rock_Structures
2026-02-21T06:32:04.0973893Z DejansMods:Dejans_Structures
2026-02-21T06:32:04.0974530Z DragoKane:GrapplingHookMod
2026-02-21T06:32:04.0975343Z Dray:[Dray's] Better Spellbooks
2026-02-21T06:32:04.0976006Z Drex:BetterItemViewer
2026-02-21T06:32:04.0976579Z EineNT:VeinMining
2026-02-21T06:32:04.0977309Z Frotty27:NameplateBuilder
2026-02-21T06:32:04.0977961Z Fyrrage:Outlanders Armor Pack
2026-02-21T06:32:04.0978615Z GameMaster:Longbows Collection
2026-02-21T06:32:04.0979239Z HF:HorseFollow
2026-02-21T06:32:04.0979781Z HyOptimizer:HyOptimizer
2026-02-21T06:32:04.0980360Z HyTame:HyTame
2026-02-21T06:32:04.0980878Z Hytaled:Optimizer
2026-02-21T06:32:04.0981414Z IBC:Multitools
2026-02-21T06:32:04.0981937Z JacobG:DoubleBeds
2026-02-21T06:32:04.0982462Z JacobG:JLib
2026-02-21T06:32:04.0982961Z JarHax:EyeSpy
2026-02-21T06:32:04.0983482Z Jodo:FreeCam
2026-02-21T06:32:04.0984013Z Leiv436:Extended Backpacks
2026-02-21T06:32:04.0984635Z Linceros:GrabFromFar
2026-02-21T06:32:04.0985386Z Makapar:AreaIndicator
2026-02-21T06:32:04.0985995Z Maxos:Void Scythe Mod
2026-02-21T06:32:04.0986575Z MichaelBlades:AutoFarmer
2026-02-21T06:32:04.0987165Z MiniBox:AutoStorage
2026-02-21T06:32:04.0987729Z Mort:Mort's Wandering Merchant
2026-02-21T06:32:04.0988358Z NekoPlugins:ReviveMe
2026-02-21T06:32:04.0988929Z NoCube:[NoCube's] Bakehouse
2026-02-21T06:32:04.0989559Z NoCube:[NoCube's] Culinary
2026-02-21T06:32:04.0990169Z NoCube:[NoCube's] Cultivation
2026-02-21T06:32:04.0990804Z NoCube:[NoCube's] Neon Blocks
2026-02-21T06:32:04.0991432Z NoCube:[NoCube's] Orchard
2026-02-21T06:32:04.0992040Z NoCube:[NoCube's] Simple Bags
2026-02-21T06:32:04.0992680Z NoCube:[NoCube's] Tavern
2026-02-21T06:32:04.0993284Z NoCube:[NoCube's] Undead Warriors
2026-02-21T06:32:04.0993941Z Onilke:Expanded Necromancy
2026-02-21T06:32:04.0994583Z Pedrijoe:PJ-HyperSalvager
2026-02-21T06:32:04.0995456Z Refresh Studios:YUNG's HyDungeons
2026-02-21T06:32:04.0996173Z RocketSheep:AreaDepositorMod
2026-02-21T06:32:04.0996811Z SAIMUSGAMING:Portal World
2026-02-21T06:32:04.0997427Z Samiracle:SleepRegeneration
2026-02-21T06:32:04.0998066Z Samiracle:WorkbenchTierKeeper
2026-02-21T06:32:04.0998696Z Sebastian:MoreMounts
2026-02-21T06:32:04.0999269Z Serilum:DisabledDurability
2026-02-21T06:32:04.0999888Z Serilum:FirstJoinMessage
2026-02-21T06:32:04.1000471Z Serilum:Hybrid
2026-02-21T06:32:04.1001004Z Serilum:RecipeWisdom
2026-02-21T06:32:04.1001558Z Serilum:StarterKit
2026-02-21T06:32:04.1002110Z Serilum:TreeHarvester
2026-02-21T06:32:04.1002682Z Serilum:WelcomeMessage
2026-02-21T06:32:04.1003254Z Serilum:WhereDidIDie
2026-02-21T06:32:04.1003813Z ShopSigns:Shop Signs
2026-02-21T06:32:04.1004375Z Skara Bay:Emerald Armor
2026-02-21T06:32:04.1004970Z SketchMacaw:Macaw's Hy Lights
2026-02-21T06:32:04.1006075Z SketchMacaw:Macaw's Hy Paths
2026-02-21T06:32:04.1006729Z SketchMacaw:Macaw's Hy Stairs
2026-02-21T06:32:04.1007379Z SketchMacaw:Macaw's Hy Windows
2026-02-21T06:32:04.1008016Z Skovos:More Arrows by Skovos
2026-02-21T06:32:04.1008643Z SlverSkull:SLVR_Robes*&\_Spells
2026-02-21T06:32:04.1009295Z StylaxGaming793:Signage Bench
2026-02-21T06:32:04.1009948Z Stylax_Shop_Boards:Shop Boards
2026-02-21T06:32:04.1010586Z TeeEmDee:Brighter Torches
2026-02-21T06:32:04.1011184Z TheRedlotus:HyFishing
2026-02-21T06:32:04.1011763Z Violet:Violet's Furnishings
2026-02-21T06:32:04.1012390Z Violet:Violet's Music Players
2026-02-21T06:32:04.1013021Z Violet:Violet's Plushies
2026-02-21T06:32:04.1013627Z Violet:Violet's Wardrobe
2026-02-21T06:32:04.1014221Z Voidane:MobCatcher
2026-02-21T06:32:04.1014782Z Vyklade:Unified Magic Theory
2026-02-21T06:32:04.1015637Z Ziggfreed:MMOSkillTree
2026-02-21T06:32:04.1016214Z Zurku:Gravestones
2026-02-21T06:32:04.1016757Z benndevs:Ben's Sharks
2026-02-21T06:32:04.1017322Z cali19:TravelingMounts
2026-02-21T06:32:04.1017904Z com.alexispace:Alexi's RowBoat
2026-02-21T06:32:04.1018554Z com.carsonk:Party Plugin
2026-02-21T06:32:04.1019333Z com.clayrok:SocialMenu
2026-02-21T06:32:04.1019926Z com.hymarkers:HyMarkers
2026-02-21T06:32:04.1020533Z com.hypersonicsharkz:Hytalor
2026-02-21T06:32:04.1021194Z com.hytale:ExtendedTeleportHistory
2026-02-21T06:32:04.1021864Z com.linceros:LevelTools
2026-02-21T06:32:04.1022492Z com.woxtz.weaponinfo:Weapon Stats Viewer
2026-02-21T06:32:04.1023217Z dev.hytalemodding:Clock HUD
2026-02-21T06:32:04.1023884Z dev.hytalemodding:Hyssentials
2026-02-21T06:32:04.1024712Z dev.ninesliced:BetterMap
2026-02-21T06:32:04.1025614Z egominer's:Glider
2026-02-21T06:32:04.1026197Z fof1092:EssentialsPlus
2026-02-21T06:32:04.1026773Z heypr:PlayerCompass
2026-02-21T06:32:04.1027323Z hychatter:HyChatter
2026-02-21T06:32:04.1027873Z iTzKenar:Better Wardrobes
2026-02-21T06:32:04.1028475Z kedo:[kedo] BetterMovement
2026-02-21T06:32:04.1029096Z kyuubisoft:achievements
2026-02-21T06:32:04.1029678Z kyuubisoft:core
2026-02-21T06:32:04.1030206Z kyuubisoft:questbook
2026-02-21T06:32:04.1030776Z lilethan000:Better Loot
2026-02-21T06:32:04.1031379Z me.Zistroxy:Mighty Staffs
2026-02-21T06:32:04.1031996Z nConditional:Diagonal_Fences
2026-02-21T06:32:04.1032629Z narwhals:Perfect Parries
2026-02-21T06:32:04.1033299Z nekonesse:Cubie's Better Building
2026-02-21T06:32:04.1033956Z net.night:RecoverArrows
2026-02-21T06:32:04.1034535Z org.Krynnx:Farming Overhaul
2026-02-21T06:32:04.1035389Z org.herolias:SimpleEnchantments
2026-02-21T06:32:04.1036137Z quest_request_boards:Quest & Request Boards
2026-02-21T06:32:04.1036862Z sn0wkzy:party
2026-02-21T06:32:04.1037395Z sum1000:Boat Collections
2026-02-21T06:32:04.1037979Z tsumori:partypro
2026-02-21T06:32:04.1038528Z vhsdoggy:Builder's Workbench+
2026-02-21T06:32:04.1039164Z wanmine:WansWonderWeapon
2026-02-21T06:32:04.1039740Z works.jox:ComMenu
2026-02-21T06:32:04.1040269Z works.jox:Okey
2026-02-21T06:32:04.1040783Z x3Dev:Wayfinder
2026-02-21T06:32:04.1041294Z x3Dev:Waypoints
2026-02-21T06:32:04.1041839Z xytronix:Forgotten Temple
2026-02-21T06:32:04.1042461Z xyz.thelegacyvoyage:HyEssentialsX
2026-02-21T06:32:04.2796017Z jq: parse error: Invalid numeric literal at line 1, column 10
2026-02-21T06:32:04.2811727Z ##[error]Process completed with exit code 5.
2026-02-21T06:32:04.3047400Z Post job cleanup.
2026-02-21T06:32:04.3788364Z [command]/usr/bin/git version
2026-02-21T06:32:04.3822466Z git version 2.52.0
2026-02-21T06:32:04.3868679Z Temporarily overriding HOME='/home/runner/work/\_temp/7707f61c-2570-472e-b329-b39847c219f8' before making global git config changes
2026-02-21T06:32:04.3873144Z Adding repository directory to the temporary git global config as a safe directory
2026-02-21T06:32:04.3876726Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/Paotheon/Paotheon
2026-02-21T06:32:04.3905748Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2026-02-21T06:32:04.3937475Z [command]/usr/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
2026-02-21T06:32:04.4163646Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2026-02-21T06:32:04.4184863Z http.https://github.com/.extraheader
2026-02-21T06:32:04.4197058Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2026-02-21T06:32:04.4229036Z [command]/usr/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
2026-02-21T06:32:04.4577528Z Cleaning up orphan processes
