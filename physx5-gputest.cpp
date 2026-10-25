// SPDX-License-Identifier: MIT  (Copyright (c) 2026 Eugene Flanagin; see LICENSE)
// physx5-gputest.cpp -- small functional check that PhysX 5 GPU rigid-body
// simulation (GPU broadphase + GPU dynamics) really runs on the CUDA device
// (here: AMD Radeon RX 9070 XT via ZLUDA).  Bounded, no rendering, no PVD.
//
// Usage: physx5-gputest [--cpu] [--steps N] [--stacks N]
//   --cpu     run the same scene on the CPU pipeline (reference)
//   --steps   simulation steps (default 300 at 60 Hz)
//   --stacks  number of 10-high box pyramids (default 4 -> 220 boxes)
// Exit status 0 only when the GPU pipeline was requested AND engaged.
#include <PxPhysicsAPI.h>
#include <cudamanager/PxCudaContextManager.h>
#include <cudamanager/PxCudaContext.h>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <vector>

using namespace physx;

static int gErrors = 0, gWarnings = 0, gMissingKernels = 0;
struct VerboseErrorCallback : public PxErrorCallback
{
	void reportError(PxErrorCode::Enum code, const char* message, const char* file, int line) PX_OVERRIDE
	{
		// Known ZLUDA gap: kernels using indirect calls (ConvexCore / particle-system
		// collision) are dropped by ZLUDA's PTX compiler.  Count them, print compactly.
		if (strstr(message, "Could not find CUDA module containing function"))
		{
			gMissingKernels++;
			const char* q = strchr(message, '\''); const char* e = q ? strchr(q + 1, '\'') : NULL;
			if (q && e) printf("  [kernel unavailable on ZLUDA] %.*s\n", (int)(e - q - 1), q + 1);
			return;
		}
		const char* kind = "info";
		switch (code)
		{
		case PxErrorCode::eDEBUG_INFO: kind = "debug-info"; break;
		case PxErrorCode::eDEBUG_WARNING: kind = "debug-warning"; gWarnings++; break;
		case PxErrorCode::ePERF_WARNING: kind = "perf-warning"; gWarnings++; break;
		case PxErrorCode::eINVALID_PARAMETER: kind = "invalid-parameter"; gErrors++; break;
		case PxErrorCode::eINVALID_OPERATION: kind = "invalid-operation"; gErrors++; break;
		case PxErrorCode::eOUT_OF_MEMORY: kind = "out-of-memory"; gErrors++; break;
		case PxErrorCode::eINTERNAL_ERROR: kind = "internal-error"; gErrors++; break;
		case PxErrorCode::eABORT: kind = "abort"; gErrors++; break;
		default: break;
		}
		const char* base = strrchr(file, '/'); base = base ? base + 1 : file;
		printf("  [physx %s] %s (%s:%d)\n", kind, message, base, line);
		fflush(stdout);
	}
};

int main(int argc, char** argv)
{
	bool wantGpu = true; int steps = 300; int stacks = 4;
	for (int i = 1; i < argc; i++)
	{
		if (!strcmp(argv[i], "--cpu")) wantGpu = false;
		else if (!strcmp(argv[i], "--steps") && i + 1 < argc) steps = atoi(argv[++i]);
		else if (!strcmp(argv[i], "--stacks") && i + 1 < argc) stacks = atoi(argv[++i]);
		else { printf("usage: %s [--cpu] [--steps N] [--stacks N]\n", argv[0]); return 2; }
	}
	setvbuf(stdout, NULL, _IONBF, 0);
	printf("PhysX %d.%d.%d GPU functional test (%s pipeline requested)\n", PX_PHYSICS_VERSION_MAJOR, PX_PHYSICS_VERSION_MINOR, PX_PHYSICS_VERSION_BUGFIX, wantGpu ? "GPU" : "CPU");

	static PxDefaultAllocator allocator; static VerboseErrorCallback errorCallback;
	PxFoundation* foundation = PxCreateFoundation(PX_PHYSICS_VERSION, allocator, errorCallback);
	PxPhysics* physics = PxCreatePhysics(PX_PHYSICS_VERSION, *foundation, PxTolerancesScale(), true, NULL);

	PxCudaContextManager* cudaMgr = NULL;
	if (wantGpu)
	{
		PxCudaContextManagerDesc desc;
		cudaMgr = PxCreateCudaContextManager(*foundation, desc, PxGetProfilerCallback());
		if (cudaMgr && !cudaMgr->contextIsValid()) { printf("CUDA context manager created but context is INVALID\n"); cudaMgr->release(); cudaMgr = NULL; }
		if (!cudaMgr) { printf("RESULT: no usable CUDA context manager -> GPU PhysX unavailable\n"); return 1; }
		printf("CUDA device      : %s\n", cudaMgr->getDeviceName());
		printf("device info      : SMs=%d  clock=%u kHz  mem=%llu MiB  smem/block=%d  driver=%d  concurrentStreams=%d\n",
			cudaMgr->getMultiprocessorCount(), cudaMgr->getClockRate(), (unsigned long long)(cudaMgr->getDeviceTotalMemBytes() >> 20),
			cudaMgr->getSharedMemPerBlock(), cudaMgr->getDriverVersion(), (int)cudaMgr->getUsingConcurrentStreams());
	}

	PxSceneDesc sceneDesc(physics->getTolerancesScale());
	sceneDesc.gravity = PxVec3(0.0f, -9.81f, 0.0f);
	PxDefaultCpuDispatcher* dispatcher = PxDefaultCpuDispatcherCreate(4);
	sceneDesc.cpuDispatcher = dispatcher;
	sceneDesc.filterShader = PxDefaultSimulationFilterShader;
	sceneDesc.flags |= PxSceneFlag::eENABLE_PCM | PxSceneFlag::eENABLE_STABILIZATION;
	if (wantGpu)
	{
		sceneDesc.cudaContextManager = cudaMgr;
		sceneDesc.flags |= PxSceneFlag::eENABLE_GPU_DYNAMICS;
		sceneDesc.broadPhaseType = PxBroadPhaseType::eGPU;
		sceneDesc.gpuMaxNumPartitions = 8;
	}
	PxScene* scene = physics->createScene(sceneDesc);
	if (!scene) { printf("RESULT: createScene failed\n"); return 1; }

	PxMaterial* material = physics->createMaterial(0.5f, 0.5f, 0.6f);
	scene->addActor(*PxCreatePlane(*physics, PxPlane(0, 1, 0, 0), *material));

	std::vector<PxRigidDynamic*> bodies;
	PxShape* box = physics->createShape(PxBoxGeometry(1.0f, 1.0f, 1.0f), *material);
	const PxU32 size = 10;
	for (int s = 0; s < stacks; s++)
		for (PxU32 i = 0; i < size; i++)
			for (PxU32 j = 0; j < size - i; j++)
			{
				PxTransform tm(PxVec3(PxReal(j * 2) - PxReal(size - i), PxReal(i * 2 + 1), PxReal(-10 * s)));
				PxRigidDynamic* b = physics->createRigidDynamic(tm);
				b->attachShape(*box);
				PxRigidBodyExt::updateMassAndInertia(*b, 10.0f);
				scene->addActor(*b);
				bodies.push_back(b);
			}
	box->release();
	PxRigidDynamic* ball = PxCreateDynamic(*physics, PxTransform(PxVec3(0, 20, 60)), PxSphereGeometry(3), *material, 10.0f);
	ball->setLinearVelocity(PxVec3(0, -10, -60));
	PxRigidBodyExt::updateMassAndInertia(*ball, 1000.f);
	scene->addActor(*ball);
	printf("scene            : %zu boxes + 1 ball, %d steps @ 60 Hz\n", bodies.size(), steps);

	const bool bpIsGpu = scene->getBroadPhaseType() == PxBroadPhaseType::eGPU;
	printf("broadphase type  : %s\n", bpIsGpu ? "eGPU" : (scene->getBroadPhaseType() == PxBroadPhaseType::ePABP ? "ePABP (CPU)" : "CPU"));

	for (int i = 0; i < steps; i++)
	{
		scene->simulate(1.0f / 60.0f);
		scene->fetchResults(true);
		if (i == 0 || i == steps / 2 || i == steps - 1)
		{
			PxVec3 p = ball->getGlobalPose().p, q = bodies[0]->getGlobalPose().p;
			printf("  step %4d: ball=(%.2f %.2f %.2f) box0=(%.2f %.2f %.2f)\n", i + 1, p.x, p.y, p.z, q.x, q.y, q.z);
		}
	}

	PxSimulationStatistics st; scene->getSimulationStatistics(st);
	printf("stats            : activeDynamic=%u pairs=%u gpuMemHeap=%llu KiB (BP %llu, NP %llu, solver %llu, sim %llu)\n",
		st.nbActiveDynamicBodies, st.nbDiscreteContactPairsTotal, (unsigned long long)st.gpuMemHeap >> 10,
		(unsigned long long)st.gpuMemHeapBroadPhase >> 10, (unsigned long long)st.gpuMemHeapNarrowPhase >> 10,
		(unsigned long long)st.gpuMemHeapSolver >> 10, (unsigned long long)st.gpuMemHeapSimulation >> 10);

	int resting = 0; float maxY = 0;
	for (size_t i = 0; i < bodies.size(); i++) { PxVec3 p = bodies[i]->getGlobalPose().p; if (p.y > -0.5f && p.y < 25.f) resting++; if (p.y > maxY) maxY = p.y; }
	printf("sanity           : %d/%zu boxes within plausible bounds, max y=%.2f\n", resting, bodies.size(), maxY);

	bool gpuLastErrOk = true; int lastErr = 0;
	if (cudaMgr && cudaMgr->getCudaContext()) { lastErr = (int)cudaMgr->getCudaContext()->getLastError(); gpuLastErrOk = lastErr == 0; printf("cuda last error  : %d%s\n", lastErr, cudaMgr->getCudaContext()->isInAbortMode() ? " (ABORT MODE)" : ""); }

	const bool gpuEngaged = wantGpu && bpIsGpu && (st.gpuMemHeap > 0) && gpuLastErrOk;
	printf("RESULT: %s  (bp=%s, gpuHeap=%s, cudaErr=%d, physxErrors=%d, warnings=%d, kernelsUnavailable=%d)\n",
		wantGpu ? (gpuEngaged ? "GPU PhysX ENGAGED" : "GPU PhysX NOT engaged (fell back / failed)") : "CPU run complete",
		bpIsGpu ? "GPU" : "CPU", st.gpuMemHeap > 0 ? "yes" : "no", lastErr, gErrors, gWarnings, gMissingKernels);
	if (gMissingKernels)
		printf("note: %d kernels could not be compiled by ZLUDA (indirect calls); rigid bodies, joints, articulations\n"
		       "      and deformables are unaffected, PxConvexCoreGeometry collision and particle systems would fall back/fail.\n", gMissingKernels);

	scene->release(); dispatcher->release(); physics->release();
	if (cudaMgr) cudaMgr->release();
	foundation->release();
	return wantGpu ? (gpuEngaged && gErrors == 0 ? 0 : 1) : 0;
}
